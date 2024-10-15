//
//  HanvestNewsButtonViewModels.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation

class HanvestNewsButtonViewModels: ObservableObject {
    var stockIDName: String
    var newsTitle: String
    var newsReleaseTIme: Date
    
    init(stockIDName: String, newsTitle: String, newsReleaseTIme: Date) {
        self.stockIDName = stockIDName
        self.newsTitle = newsTitle
        self.newsReleaseTIme = newsReleaseTIme
    }
    
    func convertIntoString() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        // Calculate the difference in time between the given date and now
        let components = calendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second], from: newsReleaseTIme, to: now)
        
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
