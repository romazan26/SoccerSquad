//
//  NewPlayerView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI
import PhotosUI

struct NewPlayerView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: TeamsViewModel
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
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
                    //MARK: - Name player
                    NameTextFieldView(placeholder: "Name player", text: $vm.simplePlayerName)
                    Image(systemName: "pencil.line")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.whiteGratApp)
                }
                
                VStack {
                    //MARK: - Player Foto
                    ZStack{
                        if vm.pickerResult.isEmpty {
                            Button {
                                vm.isPresentPicker.toggle()
                            } label: {
                                NoPhotoView()
                            }
                            .sheet(isPresented: $vm.isPresentPicker, content: {
                                PhotoPicker(configuration: self.config, pickerResult: $vm.pickerResult, isPresented: $vm.isPresentPicker)
                            })
                        }else{
                            Image(uiImage: vm.pickerResult.first!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 155, height: 155)
                                .cornerRadius(80)
                        }
                        
                        //MARK: - Number text field
                        NumberPlayerCircle(text: $vm.simplePlayerNumber)
                        .frame(width: 55, height: 55)
                        .offset(x: 55, y: -50)
                    }
                    //MARK: - Age player
                    HStack(spacing: 80){
                        Button(action: {vm.ageMinus()}, label: {
                            Image(systemName: "chevron.left").foregroundStyle(.white)
                        })
                        
                        VStack{
                            Text("\(vm.simplePlayerAge)")
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .heavy))
                            Text("Years old")
                                .foregroundStyle(.whiteGratApp)
                                .font(.system(size: 16))
                        }
                        
                        Button(action: {vm.agePlus()}, label: {
                            Image(systemName: "chevron.right").foregroundStyle(.white)
                        })
                    }
                    .padding(.top, 30)
                }.padding(.top, 40)
                
                Spacer()
                
                //MARK: - Save button
                Button(action: {
                    vm.addPayer()
                    dismiss()
                }, label: {SavebuttonView()})
            }
            .padding()
        }
    }
}

#Preview {
    NewPlayerView(vm: TeamsViewModel())
}
