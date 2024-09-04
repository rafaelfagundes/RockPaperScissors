//
//  ResetButton.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct ResetButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack{
                HStack{
                    Spacer()
                    Image("icon_repeat_outline")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Reset").font(.custom("Kenney-Future", size: 20)).tracking(-2.5).foregroundStyle(.white).bold().shadow(radius: 5)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ResetButton(action: {})
}
