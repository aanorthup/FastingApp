//
//  FastingModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

enum FastingDuration: TimeInterval, CaseIterable {
    case hours1
    case hours8
    case hours12
    case hours24
    case hours36
    case hours48
    
    var duration: Double {
        switch self {
        case .hours1: return 1
        case .hours8: return 8
        case .hours12: return 12
        case .hours24: return 24
        case .hours36: return 36
        case .hours48: return 48
        }
    }
}

struct FastingModel: Identifiable {
    var id = UUID()
    var startDate: Date
    var duration: FastingDuration
    var endDate: Date
    
}

 
