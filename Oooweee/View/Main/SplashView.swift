//
//  SplashView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 7.04.2023.
//
import SwiftUI
struct SplashView: View {
    @Environment(\.dismiss) var dismiss
    @State private var remaining = 3.0
    @Binding var isLaunchFirstTime: Bool
    @Binding var launching: Bool
    var body: some View {
        VStack{
            Gifs.launchingGifs.randomElement()!
                .frame(width: 250, height: 250)
            Text(isLaunchFirstTime ? "Welcome!" : "Hello!")
                .font(.custom(Avenir.bold, fixedSize: 30))
                .foregroundColor(.black)
                .padding()
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(Color.unknown)
        .onReceive(Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()) { _ in
            self.remaining -= 0.01
            if self.remaining <= 0 {
                dismiss()
                launching = false
                if isLaunchFirstTime{
                    isLaunchFirstTime = false
                }
            }
        }
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isLaunchFirstTime: .constant(true), launching: .constant(true))
    }
}
