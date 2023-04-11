//
//  EpisodeModel.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 8.04.2023.
//

import Foundation

struct OwEpisode: Decodable, Identifiable{
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
