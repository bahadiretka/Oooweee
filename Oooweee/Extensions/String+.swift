//
//  String+.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 10.04.2023.
//

import Foundation
func parseEpisode(in urls: [String]) -> String{
    return urls.map{$0.replacingOccurrences(of: Constants.episodeUrl, with: "")}.joined(separator: ",")
}
