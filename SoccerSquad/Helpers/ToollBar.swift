//
//  ToollBar.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct ToollBar: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.grayApp
            HStack {
                Spacer()
                //MARK: - TeamsButton
                VStack {
                    Button {
                        vm.toolBarTag = 1
                    } label: {
                        VStack{
                            Image(.teams)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .colorMultiply(vm.toolBarTag == 1 ? .yellowApp : .whiteGratApp)
                        }
                }
                    Text("Teams")
                        .foregroundStyle(vm.toolBarTag == 1 ? .yellowApp : .whiteGratApp)
                        .font(.system(size: 12))
                }
                Spacer()
                //MARK: - MatchesButton
                VStack {
                    Button {
                        vm.toolBarTag = 2
                    } label: {
                        VStack{
                            Image(.matches)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .colorMultiply(vm.toolBarTag == 2 ? .yellowApp : .whiteGratApp)
                        }
                }
                    Text("Matches")
                        .foregroundStyle(vm.toolBarTag == 2 ? .yellowApp : .whiteGratApp)
                        .font(.system(size: 12))
                }
                Spacer()
                //MARK: - InventoryButton
                VStack {
                    Button {
                        vm.toolBarTag = 3
                    } label: {
                        VStack{
                            Image(.inventory)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .colorMultiply(vm.toolBarTag == 3 ? .yellowApp : .whiteGratApp)
                        }
                }
                    Text("Inventory")
                        .foregroundStyle(vm.toolBarTag == 3 ? .yellowApp : .whiteGratApp)
                        .font(.system(size: 12))
                }
                Spacer()
                //MARK: - settingButton
                VStack {
                    Button {
                        vm.toolBarTag = 4
                    } label: {
                        VStack{
                            Image(.settings)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .colorMultiply(vm.toolBarTag == 4 ? .yellowApp : .whiteGratApp)
                        }
                }
                    Text("Settings")
                        .foregroundStyle(vm.toolBarTag == 4 ? .yellowApp : .whiteGratApp)
                        .font(.system(size: 12))
                }
                Spacer()
            }
        }.frame(width: .infinity, height: 90)
    }
}

#Preview {
    ToollBar(vm: ViewModel())
}
