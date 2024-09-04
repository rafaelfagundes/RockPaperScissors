//
//  HandSign.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct HandSignChoice: View {
    var name: String = "Rock"
    var isRotated: Bool = false
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(isRotated ? .degrees(180) : .degrees(0))
        Text(name).font(.custom("Kenney-Future", size: 20)).tracking(-2.5)
    }
}

#Preview {
    HandSignChoice()
}
