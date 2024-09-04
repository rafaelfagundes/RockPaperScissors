//
//  HandSignButtonView.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct HandSignButtonView: View {
    let text: String
    let action: () -> Void
    let isDisabled: Bool
    let backgroundImage: String
    
    var body: some View {
        Button(action: {action()}){
            ZStack{
                Image(backgroundImage)
                    .resizable()
                    .frame(width: 118, height: 96)
                    .clipped()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                HStack{
                    Image(text)
                        .resizable()
                        .frame(width: 48, height: 48)
//                    Text(text).font(.callout).foregroundStyle(Color.white).bold().shadow(radius: 5)
                }
            }
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.5 : 1.0)
    }
}

#Preview {
    HandSignButtonView(
        text: "Scissors",
        action: {},
        isDisabled: false,
        backgroundImage: "button_square_depth_gradient_red"
    )
}
