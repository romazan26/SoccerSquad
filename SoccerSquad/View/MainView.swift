//
//  MainView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                if vm.toolBarTag == 1 {
                    TeamsView(vm: vm)
                }
                Spacer()
                ToollBar(vm: vm)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
