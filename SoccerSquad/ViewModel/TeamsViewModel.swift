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
    
    @Published var simplePlayerName = ""
    @Published var simplePlayerAge = 0
    @Published var simplePlayerNumber = ""
    @Published var pickerResult: [UIImage] = []
    
    init(){
        getPlayers()
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
    
    //MARK: - Save
    func save(){
        players.removeAll()
        manager.save()
        getPlayers()
    }
}
