//
//  FastingModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

enum FastingDuration: String {
    case hours1 = "15 Minutes"
    case hours8 = "8 Hours"
    case hours12 = "12 Hours"
    case hours16  = "16 Hours"
    case hours24 = "24 Hours"

    
    var duration: Double {
        switch self {
        case .hours1: return 15
        case .hours8: return 8
        case .hours12: return 12
        case .hours16: return 16
        case .hours24: return 24
        }
    }
}

struct FastingModel: Identifiable {
    var id = UUID()
    var startDate: Date
    var duration: FastingDuration
    var endDate: Date
    
}

 
