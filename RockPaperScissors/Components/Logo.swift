//
//  Logo.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .frame(width: 167, height: 108)
            .padding(.vertical, 20)
            .shadow(radius: 10)
    }
}

#Preview {
    Logo()
}
