//
//  SearchFilter.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 08/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

// Search Filter : Filters for core data request
enum SearchFiltrer {
    case list
    case details(forDay: String)
    case all
    case duplicity(forDate: Date)

    var predicate: NSPredicate {
        let date = Date()
        switch self {
        case .details(let day):
            return NSPredicate(format: "day CONTAINS[cd] %@ AND date >= %@", day, date as CVarArg)
        case .list:
            return NSPredicate(format: """
                                date >= %@ AND hour CONTAINS[cd] %@ AND stringDate == %@
                                OR hour CONTAINS[cd] %@ AND stringDate > %@
                                """,
                               date as CVarArg, hourReference,
                               date.getDateInString,
                               Constant.mainHour,
                               date.getDateInString)
        case .all:
            return NSPredicate(format: "day != nil")
        case .duplicity(let date):
            return NSPredicate(format: "date == %@", date as CVarArg)
        }
    }

    private var hourReference: String {
        let date = Date()
        let hour = Int(date.getHourInString) ?? 18
        switch hour {
        case _ where hour < 3:
            return "3"
        case _ where hour < 6:
            return "6"
        case _ where hour < 9:
            return "9"
        case _ where hour < 12:
            return "12"
        case _ where hour < 15:
            return "15"
        case _ where hour < 18:
            return "18"
        default:
            return "21"
        }
    }
}
