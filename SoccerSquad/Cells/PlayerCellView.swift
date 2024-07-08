//
//  PlayerCellView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct PlayerCellView: View {
    var body: some View {
        ZStack {
            Color.grayApp
            Text("Cristiano Ronaldo")
                .foregroundStyle(.white)
        }
        .cornerRadius(17)
        .frame(width: .infinity, height: 94)
    }
}

#Preview {
    PlayerCellView()
}
