//
//  ViewModel.swift
//  SoccerSquad
//
//  Created by Роман on 08.07.2024.
//

import Foundation
import CoreData
import UIKit

final class TeamsViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var toolBarTag = 1
    @Published var searchText = ""
    
    @Published var isPresentNewPlayerView = false
    @Published var isPresentPicker = false
    
    @Published var players: [Players] = []
    @Published var filterPlayers: [Players] = []
    
    @Published var simplePlayerName = ""
    @Published var simplePlayerAge = 0
    @Published var simplePlayerNumber = ""
    @Published var simplePlayerThing = Things.shirt
    @Published var pickerResult: [UIImage] = []
    
    init(){
        getPlayers()
        filter()
    }
    
    //MARK: - get filter players
    func filter(){
        if !searchText.isEmpty {
            filterPlayers = players.filter { $0.name!.localizedCaseInsensitiveContains(searchText) }
        }else {filterPlayers = players}
    }
    
    //MARK: - Delete player
    func deletePlayr(with id: ObjectIdentifier){
        let request = NSFetchRequest<Players>(entityName: "Players")
        do {
            players = try manager.context.fetch(request)
            guard let player = players.first(where: {$0.id == id}) else {return}
            manager.context.delete(player)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Get Data
    func getPlayers() {
        let request = NSFetchRequest<Players>(entityName: "Players")
        
        do{
            players = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Setup age
    func ageMinus(){
        if simplePlayerAge > 0 {
            simplePlayerAge -= 1
        }
    }
    
    func agePlus(){
        simplePlayerAge += 1
    }
    
    //MARK: - Add player
    func addPayer(){
        let newPlayer = Players(context: manager.context)
        newPlayer.foto = pickerResult.first
        newPlayer.name = simplePlayerName
        newPlayer.number = Int16(simplePlayerNumber) ?? 0
        newPlayer.age = Int16(simplePlayerAge)
        
        save()
        clear()
    }
    
    //MARK: - Clear property
    func clear(){
        simplePlayerName = ""
        simplePlayerAge = 0
        simplePlayerNumber = ""
        pickerResult.removeAll()
    }
    
    //MARK: - Save
    func save(){
        players.removeAll()
        manager.save()
        getPlayers()
    }
}
