//
//  PlayerView.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import SwiftUI

struct PlayerView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: TeamsViewModel
    let player: Players
    
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //MARK: - Top tool bar
                HStack{
                    //MARK: - back button
                    Button(action: {dismiss()}, label: {
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
                    Text("\(player.name ?? "")")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundStyle(.whiteGratApp)
                        .padding(.leading, -30)
                    Spacer()
                }
                
                //MARK: - Player Foto
                ZStack {
                    if let imageData = player.foto{
                        Image(uiImage: imageData)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 155, height: 155)
                            .cornerRadius(76)
                        .padding(.trailing)
                    }else {
                        NoPhotoView()
                            .frame(width: 155, height: 155)
                    }
                        
                        
                        //MARK: - Number text field
                    ZStack{
                        Circle()
                            .frame(width: 55)
                            .foregroundStyle(.yellowApp)
                        
                        Text("\(player.number)")
                            .foregroundStyle(.black)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 20)
                            .padding(.leading, 4)
                        
                        }
                        .frame(width: 55, height: 55)
                        .offset(x: 55, y: -50)
                    }
                .padding(.top, 40)
                
                    //MARK: - Age player
                        VStack{
                            Text("\(player.age)")
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .heavy))
                            Text("Years old")
                                .foregroundStyle(.whiteGratApp)
                                .font(.system(size: 16))
                        }
                    .padding(.top, 30)
                
                
                Spacer()
                
                //MARK: - Save button
                Button(action: {
                    vm.deletePlayr(with: player.id)
                    dismiss()
                }, label: {SavebuttonView(text: "DELETE")})
            }
            .padding()
            }
        .navigationBarBackButtonHidden(true)
        }
    }


//#Preview {
//    PlayerView(vm: TeamsViewModel(), player: Players())
//}
