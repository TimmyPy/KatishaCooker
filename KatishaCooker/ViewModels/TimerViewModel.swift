//
//  TimerViewModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation

final class TimerViewModel: ObservableObject {
    @Published var timers = [TimerModel]()
    
    init() {
        self.timers = ContentPreviewHelper.mockTimers()
    }
    
    func add() {
        self.timers.append(TimerModel(title: "Mock \(self.timers.count + 1)"))
    }
}
