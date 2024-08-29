//
//  File.swift
//  
//
//  Created by Manikandan on 26/08/24.
//

import SwiftUI

extension Color
{
    public init(hex: String, opacity: Double = 1.0) {
        var rgbValue:UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0xff00) >> 8) / 255.0
        let blue = Double((rgbValue & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
