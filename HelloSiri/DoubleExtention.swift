//
//  DoubleExtention.swift
//  HelloSiri
//
//  Created by Rehan Parkar on 2018-06-11.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import Foundation

extension Double {
    
    func convertToClockTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        
        return String(format: "%0d:%02d",minutes,seconds)
    }
}

