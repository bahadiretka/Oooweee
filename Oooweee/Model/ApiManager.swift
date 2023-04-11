//
//  ApiManager.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 8.04.2023.
//

import Foundation

enum FetchState{
    case loading
    case success
    case failure
    case empty
}
class ApiManager: ObservableObject{
    @Published var currentListedCharacters: [OwCharacter] = []
    @Published var locationIncludesCharacter: Bool = false
    @Published var currentLocation: OwBaseLocation?
    @Published var selectedLocation: Int = -1
    @Published var locationFetchState: FetchState = .loading
    @Published var characterFetchState: FetchState = .loading
    func fetchBaseLocation(url: String = Constants.baseLocationUrl){
        getBaseLocationBy(url: url) { location in
            self.currentLocation = location
        }
    }
    func fetchCurrentLocationCharacters(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){ [self] in
            if let currentLocation = self.currentLocation{
                if !currentLocation.results.isEmpty{
                    self.getCharactersIn(urls: currentLocation.results[self.selectedLocation].residents, completion: { characters in
                        self.currentListedCharacters = characters
                    })
                }
            }
        }
    }
    private func getCharactersIn(urls: [String], completion: @escaping (([OwCharacter]) -> ())){
        let ids = urls.map{$0.replacingOccurrences(of: Constants.characterUrl, with: "")}
        let characterSet = ids.joined(separator: ",")
        let url = URL(string: Constants.characterUrl + characterSet)!
        characterFetchState = .loading
        if ids.count == 1{
            URLSession.shared.fetchData(for: url) { (result: Result<OwCharacter, Error>) in
                switch result {
                case .success(let characters):
                    DispatchQueue.main.async {
                        self.characterFetchState = .success
                        completion([characters])
                    }
                    break
                case .failure(let error):
                    self.characterFetchState = .failure
                    print(String(describing: error))
                    break
                }
            }
        }else if ids.count > 1{
            URLSession.shared.fetchData(for: url) { (result: Result<[OwCharacter], Error>) in
                switch result {
                case .success(let characters):
                    DispatchQueue.main.async {
                        self.characterFetchState = .success
                        completion(characters)
                    }
                    break
                case .failure(let error):
                    self.characterFetchState = .failure
                    print(String(describing: error))
                    break
                }
            }
        }else{
            characterFetchState = .empty
        }
    }
    private func getBaseLocationBy(url: String, completion: @escaping ((OwBaseLocation) -> ())){
        let url = URL(string: url)!
        locationFetchState = .loading
        URLSession.shared.fetchData(for: url) { (result: Result<OwBaseLocation, Error>) in
            switch result {
            case .success(let location):
                DispatchQueue.main.async {
                    self.locationFetchState = .success
                    completion(location)
                }
                break
            case .failure(let error):
                self.locationFetchState = .failure
                print(String(describing: error))
                break
            }
        }
    }
}
