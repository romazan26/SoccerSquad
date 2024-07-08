//
//  CustomTextFieldView.swift
//  Movieplanner
//
//  Created by Роман on 07.06.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.black
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.gray)
                if text.isEmpty {
                    Text(placeholder)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.white.opacity(0.4))
                        .font(.system(size: 12))
                }
                else {
                    TextField("", text: $text)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                }
            }.padding(.horizontal)
        }
        .cornerRadius(9)
        .frame(maxWidth: .infinity)
            .frame(height: 37)
    }
}

#Preview {
    CustomTextFieldView(placeholder: "Search player", text: .constant(""))
}
