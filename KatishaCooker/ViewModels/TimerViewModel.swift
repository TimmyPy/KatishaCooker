//
//  TimerViewModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation

final class TimerViewModel: ObservableObject {
    @Published private(set) var timers: [TimerModel]
    let savedKey = "TimersData"
    
    init() {
//        self.timers = ContentPreviewHelper.mockTimers()
        if let data = UserDefaults.standard.data(forKey: savedKey) {
            if let decoded = try? JSONDecoder().decode([TimerModel].self, from: data) {
                self.timers = decoded
                return
            }
        }
        self.timers = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(self.timers) {
            UserDefaults.standard.set(encoded, forKey: savedKey)
        }
    }
    
    func add() {
        self.timers.append(TimerModel(title: "Mock \(self.timers.count + 1)"))
        self.save()
    }
    
    func remove(index: IndexSet) {
        self.timers.remove(atOffsets: index)
        self.save()
    }
    
    func move(fromIndex: IndexSet, toIndex: Int) {
        self.timers.move(fromOffsets: fromIndex, toOffset: toIndex)
        self.save()
    }
}
