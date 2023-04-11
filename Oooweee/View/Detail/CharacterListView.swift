//
//  CharacterListView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//

import SwiftUI
import SSSwiftUIGIFView
struct CharacterListView: View {
    @EnvironmentObject var apiManager: ApiManager
    var body: some View {
        TabView(selection: $apiManager.selectedLocation) {
            if let currentLocation = apiManager.currentLocation{
                ForEach(currentLocation.results.indices, id: \.self){ index in
                    VStack{
                        if apiManager.selectedLocation == index{
                            switch apiManager.characterFetchState{
                            case .loading:
                                SwiftUIGIFPlayerView(gifName: "pickle")
                                    .frame(width: 200, height: 200)
                            case .success:
                                ScrollView(showsIndicators: false){
                                    LazyVStack{
                                        ForEach(apiManager.currentListedCharacters.indices, id: \.self){ index in
                                            NavigationLink {
                                                CharacterDetailView(character: apiManager.currentListedCharacters[index])
                                            } label: {
                                                CharacterRowView(character: apiManager.currentListedCharacters[index],isOdd: index % 2 != 0)
                                                
                                            }
                                        }
                                    }
                                }
                            case .failure:
                                SwiftUIGIFPlayerView(gifName: "dance")
                                    .frame(width: 200, height: 200)
                                Text("API BOMBED")
                                    .font(.custom(Avenir.bold, size: 22))
                                Button {
                                    apiManager.fetchCurrentLocationCharacters()
                                } label: {
                                    Text("Try Again?")
                                        .font(.custom(Avenir.regular, fixedSize: 22))
                                        .padding(.vertical,10)
                                        .padding(.horizontal,35)
                                        .background(Color.unknown)
                                        .cornerRadius(.infinity)
                                        .overlay(RoundedRectangle(cornerRadius: .infinity).stroke(Color.white, lineWidth: 2))
                                }

                            case .empty:
                                VStack{
                                    SwiftUIGIFPlayerView(gifName: "god")
                                        .frame(width: 200, height: 200)
                                    Text("Perished")
                                        .font(.custom(Avenir.bold, size: 22))
                                }
                            }
                        }else{
                            EmptyView()
                        }
                    }
                    .tag(index)
                }
            }
        }
        .id(apiManager.currentListedCharacters.first)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
