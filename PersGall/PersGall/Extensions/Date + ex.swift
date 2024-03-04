//
//  Date + ex.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 23.02.2024.
//

import UIKit

extension Date {
    func getDateDifference() -> String {
        let currentDataInterval = Int(Date().timeIntervalSinceReferenceDate)
        let dateDifferences = Double(currentDataInterval - Int(self.timeIntervalSinceReferenceDate))
        let dateDifferencesDate = Int(round(dateDifferences / 86400))
        
        switch dateDifferencesDate {
        case 0:
            return "Сегодня"
        case 1:
            return "Вчера"
        case 2...4:
            return "\(dateDifferencesDate) дня назад"
        default:
            return "\(dateDifferencesDate) дней назад"
        }
    }
    
    func formateDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru")
        formatter.dateFormat = "dd LLLL yyyy"
        return formatter.string(from: self)
    }
}
