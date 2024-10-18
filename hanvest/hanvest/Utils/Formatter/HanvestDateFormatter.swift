//
//  DateFormatter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

struct HanvestDateFormatter {
    // Function to convert String to Date
    static func stringToDate(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: dateString) ?? Date.now
    }

    // Function to convert Date to String
    static func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    static func getTimeDifferenceFrom(_ time: Date, to targetDate: Date = Date.now) -> String {
        let calendar = Calendar.current
        
        // Calculate the difference in time between the given date and now
        let components = calendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second], from: time, to: targetDate)
        
        // Determine the relative time description
        if let year = components.year, year > 0 {
            return "\(year) year\(year > 1 ? "s" : "") ago"
        } else if let week = components.weekOfYear, week > 0 {
            return "\(week) week\(week > 1 ? "s" : "") ago"
        } else if let day = components.day, day > 0 {
            return "\(day) day\(day > 1 ? "s" : "") ago"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour) hour\(hour > 1 ? "s" : "") ago"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute) minute\(minute > 1 ? "s" : "") ago"
        } else {
            return "Just now"
        }
    }
}
