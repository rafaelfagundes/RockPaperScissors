//
//  NextButton.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct NextButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack{
                Image("button_rectangle_depth_gradient_green")
                HStack{
                    Text("Next Round").font(.custom("Kenney-Future", size: 20)).tracking(-2.5).foregroundStyle(.white).bold().shadow(radius: 5)
                    Image("arrow_basic_e")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}

#Preview {
    NextButton(action: {})
}
