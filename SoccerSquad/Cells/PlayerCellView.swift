//
//  PlayerCellView.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import SwiftUI

struct PlayerCellView: View {
    let player: Players
    var body: some View {
        ZStack {
            Color.grayApp
            HStack {
                
                //MARK: - Foto player
                ZStack {
                    if let imageData = player.foto{
                        Image(uiImage: imageData)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 71, height: 71)
                            .cornerRadius(50)
                        .padding(.trailing)
                    }else {
                        NoPhotoView()
                            .frame(width: 71, height: 71)
                    }
                    
                    ZStack{
                        Circle()
                            .foregroundStyle(.yellowApp)
                            .frame(width: 26)
                        Text("\(player.number)")
                            .foregroundStyle(.black)
                            .font(.system(size: 16, weight: .heavy))
                    }.offset(x: 20, y: -20)
                    
                }
                
                //MARK: - Text
                VStack(alignment: .leading) {
                    Text("\(player.name ?? "")")
                        .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .heavy))
                    Text("\(player.age) years old")
                        .foregroundStyle(.whiteGratApp)
                        .font(.system(size: 15, weight: .heavy))
                }
                
                Spacer()
                
                //MARK: - Open card player button
                ZStack{
                    Circle()
                        .foregroundStyle(.yellowApp)
                        .frame(width: 31)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 6, height: 10)
                        .foregroundStyle(.black)
                }
                
            }.padding()
        }
        .cornerRadius(17)
        .frame(width: .infinity, height: 94)
    }
}

//#Preview {
//    PlayerCellView(player: Players())
//}
