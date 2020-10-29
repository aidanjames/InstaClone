//
//  Date+Ext.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 29/10/2020.
//

import Foundation

extension Date {
    
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    
    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }
    
    
    func timeSince(_ date: Date) -> String {
        
        let differenceInSeconds = Int(self.timeIntervalSince(date))
        
        // If over a week ago
        guard differenceInSeconds < 604800 else {
            let formatter = DateFormatter()
            // Not this year?
            if !date.isInSameYear(as: Date()) {
                formatter.setLocalizedDateFormatFromTemplate("MMMM dd, yyyy")
                return formatter.string(from: date)
            }
            // This year
            formatter.setLocalizedDateFormatFromTemplate("MMMM dd")
            return formatter.string(from: date)
        }
        
        // if seconds
        guard differenceInSeconds > 60 else {
            if differenceInSeconds < 2 {
                return "1 second ago"
            }
            return ("\(differenceInSeconds) seconds ago")
        }
        
        // if minutes
        guard differenceInSeconds > 3600 else {
            if differenceInSeconds < 60 {
                return "1 minute ago"
            }
            return ("\(differenceInSeconds / 60) minutes ago")
        }
        
        // if hours
        guard differenceInSeconds > 86400 else {
            if differenceInSeconds < 7200 {
                return "1 hour ago"
            }
            return ("\(differenceInSeconds / 3600) hours ago")
        }
        
        // if days
        if differenceInSeconds < 172800 {
            return "1 day ago"
        }
        return ("\(differenceInSeconds / 8640) days ago")
        
    }
    
}
