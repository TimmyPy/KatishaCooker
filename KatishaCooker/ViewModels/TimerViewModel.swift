//
//  TimerViewModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var timers = [TimerModel]()
    
    init() {
        self.timers = ContentPreviewHelper.mockTimers()
    }
}
