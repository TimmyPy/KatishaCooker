//
//  TimerModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation


struct TimerModel: Identifiable, Codable {
    var id = UUID()
    var title: String = ""
    var isActive: Bool = false
    var time: String = "00:00:00"
    var initialTime: UInt16 = 0
    var endDate = Date()
    
    var minutes: UInt16 = 5 {
        didSet {
            self.time = "\(Int(minutes)):00:00"
        }
    }
}
