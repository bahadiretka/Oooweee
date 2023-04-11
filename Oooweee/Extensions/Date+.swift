//
//  Date+.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 10.04.2023.
//

import Foundation

extension Date{
    static func parseDate(_ input: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterReturns = DateFormatter()
        dateFormatterReturns.dateFormat = "d MMM yyyy, hh:mm:ss "
        let date = dateFormatterGet.date(from: input)
        return dateFormatterReturns.string(from: date ?? Date())
    }
    static func dateForRow(input: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterReturns = DateFormatter()
        dateFormatterReturns.dateFormat = "d MMM yyyy"
        let date = dateFormatterGet.date(from: input)
        return dateFormatterReturns.string(from: date ?? Date())
    }
}
