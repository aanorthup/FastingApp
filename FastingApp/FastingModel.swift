//
//  FastingModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

enum FastingDuration: TimeInterval {
    case hours1
    case hours8
    case hours12
    case hours24
    case hours36
    case hours48
    
    var duration: TimeInterval {
        switch self {
        case .hours1: return 15
        case .hours8: return 8 * 60 * 60
        case .hours12: return 12 * 60 * 60
        case .hours24: return 24 * 60 * 60
        case .hours36: return 36 * 60 * 60
        case .hours48: return 48 * 60 * 60
        }
    }
}

struct FastingModel: Identifiable {
    var id = UUID()
    var startDate: Date
    var duration: FastingDuration
    var endDate: Date {
        return startDate.addingTimeInterval(duration.duration)
    }
}

 
