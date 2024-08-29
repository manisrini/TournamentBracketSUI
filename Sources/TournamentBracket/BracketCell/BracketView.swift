//
//  MatchupView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct BracketView: View {
    
    var matchup : Matchup
    var isLastColumn : Bool
    var isFirstColumn : Bool
    var heightExp : Int
    var isTopMatch : Bool
    var isCollapsed : Bool
    
    @EnvironmentObject var theme : TournamentBracketTheme
    
    init(matchup: Matchup, isLastColumn: Bool, isFirstColumn: Bool, heightExp: Int, isTopMatch: Bool, isCollapsed: Bool) {
        self.matchup = matchup
        self.isLastColumn = isLastColumn
        self.isFirstColumn = isFirstColumn
        self.heightExp = heightExp
        self.isTopMatch = isTopMatch
        self.isCollapsed = isCollapsed
    }
    
    var body: some View {
            
        HStack(spacing : 0){
            
            leftLineArea
            
            VStack(alignment: .leading,spacing: 5) {
                
                if !isCollapsed{
                    HStack{
                        Text(matchup.date)
                            .customFontStyle(theme.font)
                        Spacer()
                        Text(matchup.additionalInfo)
                            .customFontStyle(theme.font)
                    }
                }
                 
                ScoreView(team: matchup.team1)
                
                if !isCollapsed{
                    ScoreView(team: matchup.team2)
                }

            }
            .padding()
            .frame(width: 250,height: isCollapsed ? 50 : 100)
            .cornerRadiusStyle()
                
            rightLineArea
        }
        .frame(height: height)
        .transition(.opacity.combined(with: .scale(1, anchor: .top)))
    }
    
    private var height : CGFloat{
        let cellHeight : CGFloat =  120
        return cellHeight * pow(2, CGFloat(heightExp))
    }
    
    private var leftLineArea : some View{
        Group{
            if !isFirstColumn{
                SleepingLine()
            }else{
                Spacer()
            }
        }
    }
    
    private var rightLineArea : some View{
        Group{
            if !isLastColumn{
                rightLine
            }else{
                Spacer()
                    .frame(width: UIScreen.main.bounds.width * 0.05,height: 2)
            }
        }
    }
    
    private var rightLine : some View{
        HStack(spacing : 0){
            SleepingLine()
            
            if isTopMatch{
                topMatchVerticalLine
            }else{
                bottomMatchVerticalLine
            }
        }
    }
    
    private var topMatchVerticalLine : some View{
        VStack(spacing: 0){
            Spacer()
                .frame(height: height/2 + height/3)
            Rectangle()
                .frame(width : 2,height: height/2 + height/3)
            
        }
    }
    
    private var bottomMatchVerticalLine : some View{
        VStack(spacing: 0){
            Rectangle()
                .frame(width : 2,height: height/2 + height/3)
            Spacer()
                .frame(height: height/2 + height/3)
        }
    }

}
#Preview {
    BracketView(matchup: Matchup(id: 1, team1: nil, team2: Team(id: 2, name:"Netherland",image: UIImage(named: "Netherland"), points: 3)),isLastColumn: false,isFirstColumn: true,heightExp: 0,isTopMatch: true,isCollapsed: true)
        .environmentObject(TournamentBracketTheme())
}
