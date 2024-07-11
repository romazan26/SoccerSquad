//
//  ColorPickerView.swift
//  SoccerSquad
//
//  Created by Роман on 11.07.2024.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    @Binding var present: Bool
    
    private let colors: [Color] = [.red, .blue, .cyan, .brown, .yellow, .green, .gray, .indigo, .mint, .orange, .pink, .purple, .teal, .black, .secondary]
    
    private let adaptive =
    [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        ZStack {
            BlurUIView(style: .systemChromeMaterialDark)
                .opacity(0.8)
                .ignoresSafeArea()
            LazyVGrid(columns: adaptive) {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .foregroundStyle(color)
                        .opacity(color == selectedColor ? 1 : 0.5)
                        .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                        .onTapGesture {
                            selectedColor = color
                            present.toggle()
                        }
                }.padding(10)
            }
            .padding()
            .frame(maxWidth: .infinity)
        .cornerRadius(25)
        }
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.red), present: .constant(true))
}
