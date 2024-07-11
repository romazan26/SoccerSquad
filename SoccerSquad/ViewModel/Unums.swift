//
//  Утгьы.swift
//  SoccerSquad
//
//  Created by Роман on 11.07.2024.
//

import Foundation

enum Things: CaseIterable, Identifiable {
    case sneakers
    case shirt
    case shorts
    
    var image: ImageResource{
        switch self {
            
        case .sneakers:
            return .sneakers
        case .shirt:
            return .shirt
        case .shorts:
            return .shorts
        }
    }
    
    var id: Self {
        self
    }
}
