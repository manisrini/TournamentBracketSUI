//
//  LineView.swift
//  Brackets
//
//  Created by Manikandan on 22/08/24.
//

import SwiftUI

struct SleepingLine: View {
    var body: some View {
        Rectangle()
            .frame(width: 50,height: 1)
    }
}

struct StandingLine: View {
    var height : CGFloat = 50
    
    var body: some View {
        Rectangle()
            .frame(width: 1,height: height)
    }
}




#Preview {
   SleepingLine()
}

#Preview {
   StandingLine()
}
