//
//  TimePickerView.swift
//  KatishaCooker
//
//  Created by Artem Denisov  on 2023-09-02.
//

import Foundation
import SwiftUI


struct TimePickerView: View {
    let title: String
    let range: ClosedRange<UInt8>
    let binding: Binding<UInt8>
    
    var body: some View {
        HStack(spacing: -4.0) {
            Picker(
                title,
                selection: binding
            ) {
                ForEach(range, id: \.self) { timeIncrement in
                    HStack {
                        Spacer()
                        Text("\(timeIncrement)")
//                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
        }
    }
}
