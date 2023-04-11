//
//  BaseLocationModel.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//

import Foundation

struct OwBaseLocation: Decodable{
    var info: OwInfo
    var results: [OwLocation]
}
