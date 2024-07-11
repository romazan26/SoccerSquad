//
//  MainView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = TeamsViewModel()
    @StateObject var vmMatach = MatchViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    if vm.toolBarTag == 1 {
                        TeamsView(vm: vm)
                    }
                    if vm.toolBarTag == 2 {
                        MatchsView(vm: vmMatach)
                    }
                    if vm.toolBarTag == 3 {
                        InventoryView()
                    }
                    Spacer()
                    ToollBar(vm: vm)
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}
