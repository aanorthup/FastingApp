//
//  WeightModel.swift
//  FastingApp
//
//  Created by admin on 11/13/23.
//

import Foundation

class WeightRecord: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let weight: Double
    
    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(date, forKey: .date)
        try container.encode(weight, forKey: .weight)
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case weight
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try container.decode(Date.self, forKey: .date)
        weight = try container.decode(Double.self, forKey: .weight)
    }
}
