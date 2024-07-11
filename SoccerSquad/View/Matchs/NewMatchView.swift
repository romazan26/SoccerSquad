//
//  NewMatchView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct NewMatchView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: MatchViewModel
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            if vm.isPresentColorPicker2{
                ColorPickerView(selectedColor: $vm.simpleSecondColor, present: $vm.isPresentColorPicker2)
            }
            else if vm.isPresentColorPicker{
                ColorPickerView(selectedColor: $vm.simpleFirstColor, present: $vm.isPresentColorPicker)
            }else{
                VStack {
                    
                    //MARK: - Top tool bar
                    HStack{
                        //MARK: - back button
                        Button(action: {
                            vm.clear()
                            dismiss()
                        }, label: {
                            ZStack{
                                Circle()
                                    .foregroundStyle(.yellowApp)
                                    .frame(width: 31)
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .frame(width: 6, height: 10)
                                    .foregroundStyle(.black)
                            }
                        })
                        
                        Spacer()
                        
                        //MARK: - Name player
                        Text("New match")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .heavy))
                        
                        Spacer()
                        
                        Image(systemName: "pencil.line")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.whiteGratApp)
                    }
                    
                    //MARK: - Score and color team
                    HStack{
                        Button(action: {vm.isPresentColorPicker.toggle()}, label: {
                            Circle()
                                .foregroundStyle(vm.simpleFirstColor)
                                .frame(width: 105)
                        })
                        
                        
                        Spacer()
                        
                        //MARK: - Score
                        HStack{
                            TextField("0", text: $vm.simpleFirstScore).frame(width: 25)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                                .onSubmit() {
                                    vm.getWinner()
                                }
                            Text(":")
                            TextField("0", text: $vm.simpleSecondScore).frame(width: 25)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                                .onSubmit() {
                                    vm.getWinner()
                                }
                        }
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        
                        Spacer()
                        Button(action: {vm.isPresentColorPicker2.toggle()}, label: {
                            Circle()
                                .foregroundStyle(vm.simpleSecondColor)
                                .frame(width: 105)
                        })
                        
                    }
                    .padding(.top, 40)
                    
                    //MARK: - Titles team
                    VStack{
                        GrayTextFieldView(placeholder: "Title first team", text: $vm.simpleFirstTitle)
                            .focused($keyboardIsFocused)
                        GrayTextFieldView(placeholder: "Title second team", text: $vm.simpleSecondTitle)
                            .focused($keyboardIsFocused)
                    }
                    
                    Spacer()
                    
                    //MARK: Who wins
                    HStack{
                        
                        WinButtonView(isWin: vm.simpleFirstWin)
                        
                        Spacer()
                        
                        WinButtonView(isWin: !vm.simpleFirstWin)
                        
                        
                    }.padding(.bottom)
                    
                    //MARK: - Save button
                    Button(action: {
                        vm.addMatch()
                        dismiss()
                    }, label: {
                        SavebuttonView(text: "SAVE NEW")
                    })
                }.padding()
            }
        }
        .animation(.easeIn, value: vm.isPresentColorPicker)
        .animation(.easeIn, value: vm.isPresentColorPicker2)
        .onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {
    NewMatchView(vm: MatchViewModel())
}
