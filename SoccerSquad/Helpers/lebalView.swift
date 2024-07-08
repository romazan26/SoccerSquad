//
//  lebalView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct lebalView: View {
    var text = ""
    var width: CGFloat = 100
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 27)
                .foregroundStyle(.yellowApp)
                .frame(width: width, height: 31)
            Text(text)
                .foregroundStyle(.black)
                .font(.system(size: 19, weight: .heavy))
                .padding()
        }
    }
}

#Preview {
    lebalView(text: "TEAMS")
}
