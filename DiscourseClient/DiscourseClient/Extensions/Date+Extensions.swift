//
//  Date+Extensions.swift
//  DiscourseClient
//
//  Created by José Sancho on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

extension Date {
    func currentWithFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
