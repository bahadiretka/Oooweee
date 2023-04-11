//
//  CharacterModel.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 8.04.2023.
//
import Foundation
struct OwCharacter: Decodable, Identifiable, Equatable, Hashable{
    static func == (lhs: OwCharacter, rhs: OwCharacter) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    var id: Int = 244
    var name: String = "Mr. Poopybutthole"
    var status: String = "Alive"
    var species: String = "Poopybutthole"
    var type: String = ""
    var gender: String = "Male"
    var origin: OwOrigin = OwOrigin(name: "unknown", url: "")
    var location: OwOrigin = OwOrigin(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20")
    var image: String = "https://rickandmortyapi.com/api/character/avatar/244.jpeg"
    var episode: [String] = [
        "https://rickandmortyapi.com/api/episode/15",
        "https://rickandmortyapi.com/api/episode/21",
        "https://rickandmortyapi.com/api/episode/29",
        "https://rickandmortyapi.com/api/episode/30",
        "https://rickandmortyapi.com/api/episode/31",
        "https://rickandmortyapi.com/api/episode/34",
        "https://rickandmortyapi.com/api/episode/51"
        ]
    var url: String = "https://rickandmortyapi.com/api/character/244"
    var created: String = "2017-12-30T18:03:48.054Z"
}
