//
//  DateFormat+ReleaseDate.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 18.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func toReleaseDate(from date: Date) -> String {
        self.dateFormat = "yyyy"
        let year = self.string(from: date)
        self.dateFormat = "MM"
        let month = self.string(from: date)
        self.dateFormat = "dd"
        let day = self.string(from: date)
        return "\(day).\(month).\(year)"
    }
}
