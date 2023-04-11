//
//  InfoModel.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//

import Foundation

struct OwInfo: Decodable{
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
