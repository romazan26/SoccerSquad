//
//  TeamLabelView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct TeamLabelView: View {
    var nameTeam = "VIX"
    var colorTeam = Color(.green)
    var isWin = true
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 71)
            .foregroundStyle(colorTeam)
            Text(nameTeam)
                .foregroundStyle(.black)
                .font(.system(size: 22, weight: .heavy, design: .serif))
            if isWin {
                ZStack {
                    Circle()
                        .frame(width: 26)
                    .foregroundStyle(.yellowApp)
                    Image(.win)
                        .resizable()
                        .frame(width: 14, height: 16)
                }
                .overlay {
                    Circle()
                        .stroke(.grayApp, lineWidth: 3.0)
                }
                .offset(x: 25, y: -25)
            }
        }
    }
}

#Preview {
    TeamLabelView()
}
