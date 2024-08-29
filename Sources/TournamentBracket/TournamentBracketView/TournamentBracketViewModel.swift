//
//  TournamentBracketViewModel.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import Foundation
import DesignSystem

public class TournamentBracketTheme : ObservableObject{
    let fontColor : String
    let font : Fonts
    
    public init(fontColor : String = "000000",font : Fonts = .Roboto(.Black, 16)){
        self.font = font
        self.fontColor = fontColor
    }
}

public class TournamentBracketViewModel : ObservableObject{
 
    var tournament : Tournament
    var showTabSwitch : Bool
    var theme : TournamentBracketTheme
    
    public init(tournament: Tournament,showTabSwitch : Bool = false,theme : TournamentBracketTheme = TournamentBracketTheme()) {
        self.tournament = tournament
        self.showTabSwitch = showTabSwitch
        self.theme = theme
    }
    
    func getBracketsCount(_ round : Round) -> Int{
        return round.matchUps.count / 2
    }
    
    func isLastColumn(_ index : Int) -> Bool{
        if index == tournament.rounds.count - 1{
            return true
        }else{
            return false
        }
    }
    
    func isFirstColumn(_ index : Int) -> Bool{
        if index == 0{
            return true
        }else{
            return false
        }
    }


}
