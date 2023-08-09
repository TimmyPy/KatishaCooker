//
//  TimerModel.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-08-06.
//

import Foundation

struct TimerEntityModel: Codable  {
//    let id: Int
    var countDownTimer: UInt16?;
    var initialValue: UInt16?;
    var isRunning: Bool;
    var name: String?;
}
