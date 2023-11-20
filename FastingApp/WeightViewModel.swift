//
//  WeightViewModel.swift
//  FastingApp
//
//  Created by admin on 11/13/23.
//

import Foundation
import SwiftUI

class WeightViewModel: ObservableObject {
    
    @Published var weightInput: String = ""
    @Published var weightRecords: [WeightRecord] = []
    
    func addWeight() {
        guard let weight = Double(weightInput) else { return }
        
        let currentDate = Date()
        let weightRecord = WeightRecord(date: currentDate, weight: weight)
        weightRecords.append(weightRecord)
        
        weightInput = ""
        
    }
    
}
