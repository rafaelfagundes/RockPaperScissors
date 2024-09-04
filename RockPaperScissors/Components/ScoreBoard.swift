//
//  ScoreBoard.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct ScoreBoard: View {
    var winCount: Int = 0
    var loseCount: Int = 0
    
    var body: some View {    
        HStack {
            Spacer()
            HStack{
                VStack(alignment: .center){
                    Text("\(winCount)")
                        .font(.custom("Kenney-Future-Narrow", size: 24))
                        .foregroundStyle(Color(red: 0.07, green: 0.18, blue: 0.18, opacity: 1.00))
                        .tracking(-2.5)
                    Text("wins")
                        .font(.custom("Kenney-Future-Narrow", size: 12))
                        .foregroundStyle(Color(red: 0.07, green: 0.18, blue: 0.18, opacity: 1.00))
                        .tracking(-2.5)
                }
            }
            .frame(width: 100)
            
            Image("star")
                .resizable()
                .frame(width: 35, height: 35)
            
            HStack{
                VStack(alignment: .center){
                    Text("\(loseCount)")
                        .font(.custom("Kenney-Future-Narrow", size: 24))
                        .foregroundStyle(Color(red: 0.07, green: 0.18, blue: 0.18, opacity: 1.00))
                        .tracking(-2.5)
                    Text("losses")
                        .font(.custom("Kenney-Future-Narrow", size: 12))
                        .foregroundStyle(Color(red: 0.07, green: 0.18, blue: 0.18, opacity: 1.00))
                        .tracking(-2.5)
                }
            }
            .frame(width: 100)
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color(red: 0.86, green: 0.71, blue: 0.24, opacity: 1.00))
        .cornerRadius(7)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ScoreBoard()
}




