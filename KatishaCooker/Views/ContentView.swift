//
//  ContentView.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-07-31.
//

import SwiftUI

struct TimerEntityGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            HStack() {
                configuration.content
            }
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct TimerLabelView: View {
    @State var title: String

    var body: some View {
        TextField(
            "Title",
            text: $title
        )
        .font(.system(size: 25))
    }
}

struct TimerRowView: View {
    @Binding var timer: TimerModel
    @State var tmv: TimerViewModel
    
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(){
            GroupBox(
                label: TimerLabelView(title: timer.title)
            ) {
                Text("\(timer.time)")
                    .frame(alignment: .leading)
                    .font(.system(size: 45))
            }
            .groupBoxStyle(TimerEntityGroupBoxStyle())
            
            Spacer()
            
            Button(
                action: {
                    print("\(timer.isActive), \(timer.title) \(timer.id)")
                    self.tmv.toggleTimer(tId: timer.id)
                    print("\(timer.isActive), \(timer.title)")
                },
                label: {
                    Circle()
                        .overlay(
                            Image(systemName: timer.isActive == true ? "pause.fill": "play.fill")
                                .foregroundColor(.white)
                        )
                }
            )
            .accentColor(timer.isActive == true ? .red: .blue)
            .frame(width: 55, height: 55)
            .background(.white)
            .clipShape(Rectangle())
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct ContentView: View {
    
    @StateObject private var tmv = TimerViewModel()
    
    let t = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack{
            List {
                ForEach($tmv.timers) { $timerEntity in
                    TimerRowView(timer: $timerEntity, tmv: tmv)
                }
                .onDelete { indexSet in
                    tmv.remove(index: indexSet)
                }
                .onMove { indexSet, index in
                    tmv.move(fromIndex: indexSet, toIndex: index)
                }
            }
            .toolbar {
                EditButton()
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    print("Plus button click")
                    tmv.add()
                }, label: {
                    Circle()
                        .accentColor(.cyan)
                        .frame(width: 100, height: 100, alignment: .center)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        )
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
