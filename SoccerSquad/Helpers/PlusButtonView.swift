//
//  PlusButtonView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct PlusButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 61)
                .foregroundStyle(.yellowApp)
            Text("+")
                .foregroundStyle(.black)
                .font(.system(size: 30))
        }
    }
}

#Preview {
    PlusButtonView()
}
