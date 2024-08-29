//
//  CustomViewModifiers.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI

struct CustomCorners : ViewModifier{
    
    var cornerRadius : CGFloat
    var borderWidth : CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: borderWidth)
            }
    }
}


extension View{
    func cornerRadiusStyle(_ cornerRadius : CGFloat = 5,_ borderWidth : CGFloat = 1) -> some View{
        modifier(CustomCorners(cornerRadius: cornerRadius,borderWidth: borderWidth))
    }
}
