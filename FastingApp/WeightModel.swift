//
//  WeightModel.swift
//  FastingApp
//
//  Created by admin on 11/13/23.
//

import Foundation

class WeightRecord: Identifiable {
    let id = UUID()
    let date: Date
    let weight: Double
    
    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
}
