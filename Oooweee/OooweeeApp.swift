//
//  OooweeeApp.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 7.04.2023.
//

import SwiftUI
@main
struct OooweeeApp: App {
    @AppStorage("isLaunchFirstTime") var isLaunchFirstTime: Bool = true
    @State private var launching = true
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
                .overlay{
                    if launching{
                        SplashView(isLaunchFirstTime: $isLaunchFirstTime, launching: $launching)
                    }
                }
        }
    }
}
