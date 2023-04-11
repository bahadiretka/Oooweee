//
//  LocationModel.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 8.04.2023.
//

import Foundation

struct OwLocation: Decodable, Identifiable, Equatable{
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}
