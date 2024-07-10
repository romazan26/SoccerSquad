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
            VStack(alignment: .leading, spacing: 20) {
                
                //MARK: - Top tool bar
                ZStack {
                    Color.grayApp
                    HStack{
                        lebalView(text: "TEAMS", width: 100)
                            .padding(.trailing)
                        CustomTextFieldView(placeholder: "Search player", text: $vm.searchText)
                            .onSubmit() {
                                vm.filter()
                            }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                }
                
                .frame(height: 123)
                
                //MARK: - Count of Players
                Text("Total players: \(vm.players.count)")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .heavy))
                    .padding(.horizontal)
                
                VStack(alignment: .leading){
                    
                    //MARK: - List players
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                        ScrollView{
                            ForEach(vm.filterPlayers) { player in
                                NavigationLink {
                                    PlayerView(vm: vm, player: player)
                                } label: {
                                    PlayerCellView(player: player)
                                }    
                            }
                            
                        }
                        
                        //MARK: - Add player button
                        HStack {
                            Spacer()
                            Button(action: {vm.isPresentNewPlayerView.toggle()}, label: {
                                PlusButtonView()
                            })
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
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
