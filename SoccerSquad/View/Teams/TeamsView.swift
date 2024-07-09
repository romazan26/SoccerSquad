//
//  TeamsView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct TeamsView: View {
    @StateObject var vm: TeamsViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(spacing: 20) {
                
                //MARK: - Top tool bar
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
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                        ScrollView{
                            PlayerCellView()
                        }.padding(.top)
                        
                        //MARK: - Add player button
                        Button(action: {vm.isPresentNewPlayerView.toggle()}, label: {
                            PlusButtonView()
                        })
                        
                    }
                }.padding()
                Spacer()
            }
        }
        .sheet(isPresented: $vm.isPresentNewPlayerView, content: {
            NewPlayerView(vm: vm)
        })
    }
}

#Preview {
    TeamsView(vm: TeamsViewModel())
}
