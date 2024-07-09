//
//  MatchViewModel.swift
//  SoccerSquad
//
//  Created by Роман on 09.07.2024.
//

import Foundation
import SwiftUI

final class MatchViewModel: ObservableObject{
    @Published var searchText = ""
    
    @Published var colorSelect = Color.white
}
