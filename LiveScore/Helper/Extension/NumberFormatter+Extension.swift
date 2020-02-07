//
//  NumberFormatter+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation
import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    static let withComma:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
    
    var formattedWithComma:String{
        return Formatter.withComma.string(for: self) ?? ""
    }
}
func getDateFromTimeStamp(timeStamp : Int, type:String) -> String {
    
    let date = NSDate(timeIntervalSince1970: Double(timeStamp))
    
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = type
    
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}
