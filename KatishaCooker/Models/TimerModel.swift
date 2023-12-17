//
//  TimerModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation


class TimerModel: Identifiable, Codable {
    var id: UUID
    var title: String
    var duration: Double
    var isActive: Bool
    
    // read-only comupet properties
    var time: String {
        let timeInterval = Int(self.duration)
        let hours: Int = timeInterval / 3600
        let minutes: Int = timeInterval / 60 % 60
        let seconds: Int = timeInterval % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    init(title: String, duration: Double) {
        self.id = UUID()
        self.duration = duration
        self.title = title
        
        self.isActive = false
    }
    
    func set_title(value: String) {
        self.title = value
    }
    
    func set_duration(value: Double) {
        self.duration = value
    }
    
    func toggle() {
        self.isActive.toggle()
    }
}
