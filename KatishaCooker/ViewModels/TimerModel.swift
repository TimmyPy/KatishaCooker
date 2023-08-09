//
//  TimerModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-09.
//

import Foundation

class TimerModel: Identifiable {
    
    let id = UUID()
    var timer: TimerEntityModel
    
    init(timer: TimerEntityModel) {
        self.timer = timer
    }
    
    var title: String {
        return timer.name ?? ""
    }
    
    var initialTime: UInt16 {
        return timer.initialValue ?? 0
    }
    
    var remainTime: UInt16 {
        return timer.countDownTimer ?? 0
    }
    
    var isRunning: Bool {
        get {
            return timer.isRunning
        }
        set {
            timer.isRunning = newValue
        }
    }
    
}
