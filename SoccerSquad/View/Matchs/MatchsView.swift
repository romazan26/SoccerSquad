//
//  MatchsView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct MatchsView: View {
    @StateObject var vm: MatchViewModel
    var body: some View {
        ZStack{
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                
                //MARK: - Top tool bar
                ZStack {
                    Color.grayApp
                    HStack{
                        lebalView(text: "MATCHES", width: 119)
                            .padding(.trailing)
                        CustomTextFieldView(placeholder: "Search match", text: $vm.searchText)
                            .onSubmit() {
                                //vm.filter()
                            }
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                }.frame(height: 123)
                //MARK: - Count of Players
                Text("Total players: \(vm.matchs.count)")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .heavy))
                    .padding(.horizontal)
                
                VStack(alignment: .leading){
                    
                    //MARK: - List players
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                        ScrollView{
                            ForEach(vm.matchs) { match in
                                    MatchCellView(match: match)
                            }
                            
                        }
                        
                        //MARK: - Add player button
                        HStack {
                            Spacer()
                            Button(action: {vm.isPresentNewMathView.toggle()}, label: {
                                PlusButtonView()
                            })
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }.sheet(isPresented: $vm.isPresentNewMathView, content: {
            NewMatchView(vm: vm)
        })
    }
}

#Preview {
    MatchsView(vm: MatchViewModel())
}
