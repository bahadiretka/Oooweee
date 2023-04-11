//
//  HeaderView.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 9.04.2023.
//

import SwiftUI
import SSSwiftUIGIFView
struct HeaderView: View {
    var body: some View {
        Color.unknown
                .frame(width: UIScreen.screenWidth,height: 100)
                .overlay{
                    HStack{
                        SwiftUIGIFPlayerView(gifName: "oooweee")
                            .frame(width: 50,height: 50)
                            .scaleEffect(2.0)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Text("Oooweee")
                        .font(.custom(Avenir.bold, fixedSize: 22))
                        .padding(.top,40)
                }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
