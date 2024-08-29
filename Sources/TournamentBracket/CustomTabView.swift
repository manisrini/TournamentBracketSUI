//
//  CustomTabView.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI
import DesignSystem

typealias selectedTabIndex = Int
typealias prevSelectedTabIndex = Int

struct CustomTabView: View {
    
    var tabs : [String] = []
    var numberOfTabs : Int
    
    @Binding var selectedIndex : Int
    var didSelectTab : ((prevSelectedTabIndex,selectedTabIndex)->())?
    
    init(numberOfTabs: Int = 4, selectedIndex: Binding<Int>, didSelectTab: ((prevSelectedTabIndex, selectedTabIndex) -> Void)? = nil) {
        self.numberOfTabs = numberOfTabs
        self._selectedIndex = selectedIndex
        self.didSelectTab = didSelectTab
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(Color(hex: "242832"))
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(Array(getTabs().enumerated()),id: \.element) { index,tab in
                        
                        Button {
                            self.didSelectTab?(selectedIndex,index)
                            selectedIndex = index
                        } label: {
                            VStack{
                                TabItem(tab: tab, isEqual: selectedIndex == index)
                            }
                        }
                    }
                }
                .padding(.leading,5)
            }
        }
    }
    
    func getTabs() -> [String]{
        if self.numberOfTabs == 5{
            return ["Round of 32","Round of 16","Quarters","Semis","Final"]
        }else{
            return ["Round of 16","Quarters","Semis","Final"]
        }
    }
}

struct TabItem : View{
    
    var tab : String
    var isEqual : Bool
    @EnvironmentObject var theme : TournamentBracketTheme

    var body : some View{
        Text(tab)
            .foregroundStyle(Color.white)
            .padding(.horizontal,16)
            .customFontStyle(theme.font)
        
        if isEqual{
            Rectangle()
                .frame(width: 50,height: 3)
                .foregroundStyle(Color.white)
        }else{
            Rectangle()
                .frame(width: 50,height: 3)
                .foregroundStyle(Color(hex: "242832"))
        }

    }
}

#Preview {
    CustomTabView( selectedIndex: .constant(0), didSelectTab : {_,_ in
        
    }).environmentObject(TournamentBracketTheme())
}
