//
//  NameTextFieldView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct NameTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.main
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                    if text.isEmpty {
                        Text(placeholder)
                            .padding(.horizontal, 5)
                            .foregroundStyle(.white.opacity(0.5))
                            .font(.system(size: 27))
                            .multilineTextAlignment(.center)
                    }
                    
                    TextField("", text: $text)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.white)
                        .font(.system(size: 27,weight: .heavy))
                        .multilineTextAlignment(.center)
                }
        }
        .cornerRadius(9)
        .frame(maxWidth: .infinity)
            .frame(height: 37)
    }
}

#Preview {
    NameTextFieldView(text: .constant(""))
}
