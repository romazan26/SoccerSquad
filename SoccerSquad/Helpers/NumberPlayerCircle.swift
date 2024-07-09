//
//  NamberPlayerCircle.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct NumberPlayerCircle: View {
    @Binding var text: String
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 55)
                .foregroundStyle(.yellowApp)
            if text.isEmpty {
                Image(systemName: "pencil.line")
            }
                TextField("", text: $text)
                .foregroundStyle(.black)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 20)
                .padding(.leading, 3)
            
            }
        }
    
}

#Preview {
    NumberPlayerCircle(text: .constant(""))
}
