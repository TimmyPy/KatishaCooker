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
            configuration.content
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct TimerLabelView: View {
    let title: String

    var body: some View {
        Label(title, systemImage: "bolt.fill" )
            .labelStyle(.titleOnly)
            .font(.system(size: 25))
    }
}

struct TimerRowView: View {
    @State var timer: TimerModel
    @State var tmv: TimerViewModel
    
    var body: some View {
        let _ = Self._printChanges()
        // Todo: make time on the same level as play button
        HStack(){
            GroupBox(
                label: TimerLabelView(title: timer.title)
            ) {
                Text("\(timer.time)")
//                    .padding(.vertical, 15)
                    .frame(alignment: .leading)
                    .font(.system(size: 45))
            }
            .groupBoxStyle(TimerEntityGroupBoxStyle())
            
            Spacer()
            
            Button(
                action: {
                    print("\(timer.isActive), \(timer.title) \(timer.id)")
                    self.timer.isActive.toggle()
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
    
    @ObservedObject var tmv = TimerViewModel()
    
    private let t = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack{
            List {
                ForEach(tmv.timers, id: \.id) { timerEntity in
                    TimerRowView(timer: timerEntity, tmv: tmv)
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
