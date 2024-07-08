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
                Spacer()
                ToollBar(vm: vm)
            }
        }
    }
}

#Preview {
    MainView()
}
