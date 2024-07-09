//
//  NewPlayerView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI
import PhotosUI

struct NewPlayerView: View {
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
                
                
                
                ZStack{
                    
                    //MARK: - Player Foto
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
            }
        }
    }
}

#Preview {
    NewPlayerView(vm: TeamsViewModel())
}
