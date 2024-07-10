//
//  MatchCellView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct MatchCellView: View {
    let math: Matchs
    var body: some View {
        ZStack {
            Color.grayApp
            HStack {
                
                //MARK: - FirstTeam
                TeamLabelView(nameTeam: math.titleFirst ?? "", colorTeam: .green, isWin: math.winFirst)
                Spacer()
                //MARK: - Score match
                VStack {
                    Text("\(math.scoreFirst):\(math.scoreSecond)")
                        .foregroundStyle(.white)
                        .font(.system(size: 32,weight: .heavy))
                    Text("\(math.titleFirst ?? "") - \(math.titleSecond ?? "")")
                        .foregroundStyle(.whiteGratApp)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                //MARK: - SecondTeam
                TeamLabelView(nameTeam: math.titleSecond ?? "", colorTeam: .red, isWin: !math.winFirst)
                
            }.padding()
        }
        .frame(height: 94)
        .cornerRadius(17)
    }
}

//#Preview {
//    MatchCellView(math: Matchs())
//}
