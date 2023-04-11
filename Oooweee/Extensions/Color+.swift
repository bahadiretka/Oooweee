//
//  Color+.swift
//  Oooweee
//
//  Created by Bahadır Etka Kılınç on 10.04.2023.
//

import Foundation
import SwiftUI
extension Color{

    func opposite() -> Color {
        let ciColor = CIColor(color: UIColor(self))
        let compRed: CGFloat = 1.0 - ciColor.red
        let compGreen: CGFloat = 1.0 - ciColor.green
        let compBlue: CGFloat = 1.0 - ciColor.blue
        return Color(red: compRed, green: compGreen, blue: compBlue)
    }
    static var male = Color("appColor_Male")
    static var female = Color("appColor_Female")
    static var genderless = Color("appColor_Genderless")
    static var unknown = Color("appColor_unknown")
}

