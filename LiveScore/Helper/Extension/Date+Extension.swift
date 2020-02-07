
//
//  Date+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//ˆ

import Foundation

extension Date {
    static var yesterday: Date { return Date().yesterday }
    static var tomorrow:  Date { return Date().tomorrow }
    static var today:  Date { return Date().today }
    static var twoDayAgo:  Date { return Date().twoDayAgo }
    static var twoNextDay:  Date { return Date().twoNextDay }
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var today: Date {
        return Calendar.current.date(byAdding: .day, value: 0, to: noon)!
    }
    var twoDayAgo: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    var twoNextDay: Date {
        return Calendar.current.date(byAdding: .day, value: 2, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
}

func covertDateToString(type:String,date:Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = type
    return formatter.string(from: date)
}

