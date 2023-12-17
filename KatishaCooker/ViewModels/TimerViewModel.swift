//
//  TimerViewModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation

final class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] 
    
    let hoursRange: ClosedRange<UInt8> = 0...23
    let minutesRange: ClosedRange<UInt8> = 0...59
    let secondsRange: ClosedRange<UInt8> = 0...59
    
    let savedKey = "TimersData"
    
    init() {
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
//        ToDo: Add logic
        self.timers.append(TimerModel(title: "Mock \(self.timers.count + 1)", duration: 300))
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
    
    func toggleTimer(tId: UUID) {
        if let index  = self.timers.firstIndex(where: {$0.id == tId}) {
            self.timers[index].toggle()
        }
    }
    
    func updateCountDown(tId: UUID) {
    }
    
    func timeForTimer(tId: UUID) -> String {
        let index  = self.timers.firstIndex(where: {$0.id == tId})
        return stringFromTimeInterval(timeInterval: self.timers[index!].duration)
    }
    
    private func stringFromTimeInterval(timeInterval: Double) -> String {
        let timeInterval = Int(timeInterval)
        
        let hours = (timeInterval / 3600)
        let minutes = ((timeInterval / 60) % 60)
        let seconds = (timeInterval % 60)
        
        return String(format: "%02d:%02d:%02", hours, minutes, seconds)
    }
}
