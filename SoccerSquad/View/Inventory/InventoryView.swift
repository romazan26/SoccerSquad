//
//  InventoryView.swift
//  SoccerSquad
//
//  Created by Роман on 11.07.2024.
//

import SwiftUI

struct InventoryView: View {
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Top tool bar
                ZStack {
                    Color.grayApp
                    HStack{
                        lebalView(text: "INVENTORY", width: 136)
                            .padding(.trailing)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                }.frame(height: 123)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    InventoryView()
}
