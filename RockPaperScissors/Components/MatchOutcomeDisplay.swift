//
//  MatchOutcome.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct MatchOutcomeDisplay: View {
    
    var matchOutcome: MatchOutcome?
    
    var body: some View {
        if matchOutcome == .draw {
            HStack{
                Image("check_square_color_square")
                Text("It's a Draw!").foregroundColor(.yellow).font(.custom("Kenney-Future", size: 28)).tracking(-2.5).bold()
            }
            
        } else if matchOutcome == .win {
            HStack{
                Image("check_square_color_checkmark")
                Text("You Win!").foregroundColor(.green).font(.custom("Kenney-Future", size: 28)).tracking(-2.5).bold()
            }
        } else if matchOutcome == .lose {
            HStack{
                Image("check_square_color_cross")
                Text("You Lose!").foregroundColor(.red).font(.custom("Kenney-Future", size: 28)).tracking(-2.5).bold()
            }
        } else {
            Text("I'm Ready!").font(.custom("Kenney-Future", size: 32))
            Text("Your Turn!").font(.custom("Kenney-Future", size: 24))
        }
    }
}

#Preview {
    MatchOutcomeDisplay(matchOutcome: .draw)
}
