//
//  ContentView.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-07-31.
//

import SwiftUI

class Storage {
    
}

class TimerEntity: Identifiable {
    @State var countDownTimer: UInt16;
    @State var initialValue: UInt16;
    @State var isRunning: Bool;
    @State var name: String;
    
    init(countDown: UInt16) {
        self.initialValue = countDown;
        self.countDownTimer = countDown;
        self.isRunning = false;
        self.name = "Katisha Timer";
    }
}

struct TimerLabelView: View {
    let title: String
    
    var body: some View {
        Label(title, systemImage: "bolt.fill" )
            .labelStyle(.titleOnly)
    }
}

struct TimerRowView: View {
    @State var timer: TimerModel
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(){
            // ToDo: Remove action by swipe
            GroupBox(
                label: TimerLabelView(title: timer.title)
            ) {
                Text("\(timer.remainTime):00")
                    .padding(.top, 15)
                    .frame(alignment: .leading)
                    .font(.system(size: 50))
            }
            Button(
                action: {
                    print("\(timer.isRunning), \(timer.title)")
                    self.timer.isRunning.toggle()
                    print("\(timer.isRunning), \(timer.title)")
                },
                label: {
                    Circle()
                        .overlay(
                            Image(systemName: self.timer.isRunning == true ? "pause.fill": "play.fill")
                                .foregroundColor(.white)
                        )
                }
            )
            .accentColor(self.timer.isRunning == true ? .red: .blue)
            .frame(width: 75, height: 75)
            .background(.white)
            .clipShape(Rectangle())
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var model = TimerViewModel()
    
    var body: some View {
        ZStack{
            List(model.timers, id: \.id){ timerEntity in
                TimerRowView(timer: timerEntity)
            }
            
            Spacer()
            
            Button(action: {
                print("Plus button click")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
