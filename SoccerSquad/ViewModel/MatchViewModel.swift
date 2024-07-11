//
//  MatchViewModel.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import Foundation
import SwiftUI
import CoreData

final class MatchViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var matchs: [Matchs] = []
    
    @Published var searchText = ""
    
    @Published var isPresentNewMathView = false
    @Published var isPresentColorPicker = false
    @Published var isPresentColorPicker2 = false
    
    @Published var simpleFirstTitle = ""
    @Published var simpleSecondTitle = ""
    @Published var simpleFirstScore = ""
    @Published var simpleSecondScore = ""
    @Published var simpleFirstWin = false
    @Published var simpleFirstColor = Color(.grayApp)
    @Published var simpleSecondColor = Color(.grayApp)
    
    init(){
        getMatchs()
    }
    
    //MARK: - get winner
    func getWinner(){
        if simpleFirstScore > simpleSecondScore {
            simpleFirstWin = true
        } else {
            simpleFirstWin = false
        }
    }
    
    //MARK: - Get Data
    func getMatchs(){
        let request = NSFetchRequest<Matchs>(entityName: "Matchs")
        
        do{
            matchs = try manager.context.fetch(request)
        } catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    //MARK: - Add match
    func addMatch(){
        getWinner()
        let newMatch = Matchs(context: manager.context)
        newMatch.scoreFirst = Int16(simpleFirstScore) ?? 0
        newMatch.scoreSecond = Int16(simpleSecondScore) ?? 0
        newMatch.titleFirst = simpleFirstTitle
        newMatch.titleSecond = simpleSecondTitle
        newMatch.winFirst = simpleFirstWin
        newMatch.colorFirst = UIColor(simpleFirstColor)
        newMatch.colorSecond = UIColor(simpleSecondColor)
        
        save()
        clear()
    }
    
    //MARK: - Clear property
    func clear(){
        simpleFirstTitle = ""
        simpleSecondTitle = ""
        simpleFirstScore = ""
        simpleSecondScore = ""
        simpleFirstWin = false
        simpleFirstColor = Color(.grayApp)
        simpleSecondColor = Color(.grayApp)
    }
    
    //MARK: - Save
    func save(){
        matchs.removeAll()
        manager.save()
        getMatchs()
    }
    
}
