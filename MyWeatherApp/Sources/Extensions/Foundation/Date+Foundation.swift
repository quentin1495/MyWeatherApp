//
//  Date+Foundation.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 03/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation

extension Date {

    private func getDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: Constant.timeZone)
        return formatter
    }

    /// Return hour from Date
    /// ````
    /// let hour = date.getHourInString // "15"
    /// ````
    var getHourInString: String {
        let formatter = getDateFormatter()
        formatter.dateFormat = "H"
        let hourString = formatter.string(from: self)
        return hourString
    }

    /// Return day from Date
    /// ````
    /// let day = date.getDayInString // "Monday"
    /// ````
    var getDayInString: String {
        let formatter = getDateFormatter()
        formatter.dateFormat  = "EEEE"
        let dayInWeek = formatter.string(from: self)
        return dayInWeek
    }

    /// Return complete hour from date
    /// ````
    /// let hour = date.getCompleteHourInString // "03 PM"
    /// ````
    var getcompleteHourInString: String {
        let formatter = getDateFormatter()
        formatter.dateFormat = "hh a"
        let hourString = formatter.string(from: self)
        return hourString
    }

    /// Return date in string from Date
    /// ````
    /// let date = date.getDateInString // "2018/03/20"
    /// ````
    var getDateInString: String {
        let formatter = getDateFormatter()
        formatter.dateFormat = "yyy/MM/dd"
        let hourString = formatter.string(from: self)
        return hourString
    }
}
