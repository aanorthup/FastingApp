//
//  FastingModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

enum FastingDuration: String, CaseIterable, Codable {
    case hours1 = "15 Seconds"
    case hours2 = "25 Seconds"
    case hours8 = "8 Hours"
    case hours12 = "12 Hours"
    case hours16  = "16 Hours"
    case hours24 = "24 Hours"

    
    var duration: Double {
        switch self {
        case .hours1: return 15
        case .hours2: return 25
        case .hours8: return 8 * 60 * 60
        case .hours12: return 12 * 60 * 60
        case .hours16: return 16 * 60 * 60
        case .hours24: return 24 * 60 * 60
        }
    }
}

struct FastingModel: Identifiable, Equatable, Codable {
    let id = UUID()
    let startDate: Date
    let duration: FastingDuration
    let endDate: Date
    
    static func == (lhs: FastingModel, rhs: FastingModel) -> Bool {
        return lhs.startDate == rhs.startDate &&
            lhs.duration == rhs.duration &&
            lhs.endDate == rhs.endDate
    }
    
    init(startDate: Date, duration: FastingDuration, endDate: Date) {
        self.startDate = startDate
        self.duration = duration
        self.endDate = endDate
    }
    
    enum CodingKeys: String, CodingKey {
        case startDate
        case duration
        case endDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        startDate = try container.decode(Date.self, forKey: .startDate)
        duration = try container.decode(FastingDuration.self, forKey: .duration)
        endDate = try container.decode(Date.self, forKey: .endDate)
    }
    

    
}

 
