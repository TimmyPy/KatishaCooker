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
        timers.append(TimerModel(title: "Mock1", duration: 60.00))
        return timers
    }
}
