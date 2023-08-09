//
//  Mocks.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-09.
//

import Foundation

struct ContentPreviewHelper {
    static func mockTimers() -> [TimerModel] {
        var timers = [TimerModel]()
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 25, initialValue: 25, isRunning: false, name: "Mock1")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 35, initialValue: 35, isRunning: false, name: "Mock2")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 45, initialValue: 45, isRunning: false, name: "Mock3")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 55, initialValue: 55, isRunning: false, name: "Mock4")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 65, initialValue: 65, isRunning: false, name: "Mock5")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 75, initialValue: 75, isRunning: false, name: "Mock6")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 85, initialValue: 85, isRunning: false, name: "Mock7")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 95, initialValue: 95, isRunning: false, name: "Mock8")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 15, initialValue: 15, isRunning: false, name: "Mock9")))
        timers.append(TimerModel(timer: TimerEntityModel( countDownTimer: 20, initialValue: 20, isRunning: false, name: "Mock10")))
        return timers
    }
}
