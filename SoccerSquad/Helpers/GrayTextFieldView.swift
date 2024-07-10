//
//  GrayTextFieldView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct GrayTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.grayApp
           
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    if text.isEmpty {
                        Text(placeholder)
                            .padding(.horizontal, 5)
                            .foregroundStyle(.whiteGratApp)
                            .font(.system(size: 16))
                    }
                    
                    TextField("", text: $text)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                
                
            }.padding(.horizontal)
        }
        .cornerRadius(18)
        .frame(maxWidth: .infinity)
            .frame(height: 70)
    }
}

#Preview {
    GrayTextFieldView(placeholder: "Title first team", text: .constant(""))
}
