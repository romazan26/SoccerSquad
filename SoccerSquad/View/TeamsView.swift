//
//  TeamsView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct TeamsView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                ZStack {
                    Color.grayApp
                    HStack{
                        lebalView(text: "TEAMS", width: 100)
                            .padding(.trailing)
                        CustomTextFieldView(placeholder: "Search player", text: $vm.searchText)
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                }
                
                .frame(height: 123)
                VStack(alignment: .leading){
                    //MARK: - Count of Players
                    Text("Total players: \(vm.players.count)")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .heavy))
                    
                    //MARK: - List players
                    ScrollView{
                        PlayerCellView()
                    }.padding(.top)
                }.padding()
                Spacer()
            }
        }
    }
}

#Preview {
    TeamsView(vm: ViewModel())
}
