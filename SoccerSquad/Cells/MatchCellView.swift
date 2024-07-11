//
//  MatchCellView.swift
//  SoccerSquad
//
//  Created by Роман on 10.07.2024.
//

import SwiftUI

struct MatchCellView: View {
    let match: Matchs
    var body: some View {
        ZStack {
            Color.grayApp
            HStack {
                
                //MARK: - FirstTeam
                TeamLabelView(nameTeam: match.titleFirst ?? "", colorTeam: Color(uiColor: match.colorFirst ?? .gray), isWin: match.winFirst)
                Spacer()
                //MARK: - Score match
                VStack {
                    Text("\(match.scoreFirst):\(match.scoreSecond)")
                        .foregroundStyle(.white)
                        .font(.system(size: 32,weight: .heavy))
                    Text("\(match.titleFirst ?? "") - \(match.titleSecond ?? "")")
                        .foregroundStyle(.whiteGratApp)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                //MARK: - SecondTeam
                TeamLabelView(nameTeam: match.titleSecond ?? "", colorTeam: Color(uiColor: match.colorSecond ?? .gray), isWin: !match.winFirst)
                
            }.padding()
        }
        .frame(height: 94)
        .cornerRadius(17)
    }
}

//#Preview {
//    MatchCellView(math: Matchs())
//}
