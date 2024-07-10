//
//  WinButtonView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct WinButtonView: View {
    var isWin = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 60)
                .foregroundStyle(.grayApp)
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 56)
                        .foregroundStyle(isWin ? .yellowApp : .gray)
                    Image(.win)
                        .resizable()
                        .frame(width: 14, height: 16)
                }
                Spacer()
                Text(isWin ? "WIN" : "")
                    .foregroundStyle(.white)
                    .font(.system(size: 21, weight: .heavy))
                Spacer()
            }.padding(.horizontal, 4)
        }.frame(width: 168, height: 70)
    }
}

#Preview {
    WinButtonView()
}
