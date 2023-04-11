//
//  HomeView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//

import SwiftUI

struct HomeView: View {
    init(){
        UINavigationBar.appearance().tintColor = UIColor.black
    }
    @StateObject var apiManager = ApiManager()
    var body: some View {
        NavigationView {
            VStack{
                HeaderView()
                LocationScrollView()
                    .onFirstAppear {
                        apiManager.fetchBaseLocation()
                    }
                    .environmentObject(apiManager)
                CharacterListView()
                    .environmentObject(apiManager)
            }
            .ignoresSafeArea()
            .navigationTitle("")
        }.accentColor(.black)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
