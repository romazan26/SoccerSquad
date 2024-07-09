//
//  SavebuttonView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct SavebuttonView: View {
    var text = "SAVE NEW"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 34)
                .foregroundStyle(.yellowApp)
            Text(text)
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .heavy, design: .serif))
        }.frame(width: 355, height: 68)
    }
}

#Preview {
    SavebuttonView()
}
