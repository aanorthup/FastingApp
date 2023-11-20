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
        saveWeightRecords()
        
        weightInput = ""
        
    }
    
    func saveWeightRecords() {
        do {
            let encodedData = try JSONEncoder().encode(weightRecords)
            UserDefaults.standard.set(encodedData, forKey: "weightRecords")
        } catch {
            print("Couldn't encode weight records.")
        }
    }
    
    func loadWeightRecords() {
        if let data = UserDefaults.standard.data(forKey: "weightRecords") {
            do {
                weightRecords = try JSONDecoder().decode([WeightRecord].self, from: data)
            } catch {
                print("Couldn't decode weight records.")
            }
        }
    }
    
    func loadInitialData() {
        loadWeightRecords()
    }
    
}
