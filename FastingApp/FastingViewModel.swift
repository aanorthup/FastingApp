//
//  FastingViewModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

class FastingViewModel: ObservableObject {
    @Published var fasts: [FastingModel] = []
    @Published var elapsedTime: TimeInterval = 0.0
    @Published var selectedDuration: FastingDuration?
    
    var timer: Timer?
    
    func startFasting() {
        guard let selectedDuration = selectedDuration else {
            return
        }
        let startDate = Date()
        let fastingPeriod = FastingModel(startDate: startDate, duration: selectedDuration)
        fasts.append(fastingPeriod)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateElapsedTime()
        }
        
    }
    
    private func updateElapsedTime() {
        guard let currentFasting = fasts.last else {
            return
        }
        
        elapsedTime = Date().timeIntervalSince(currentFasting.startDate)
        
        if elapsedTime >= currentFasting.duration.duration {
            timer?.invalidate()
        }
    }
 
    func deleteFasting(at index: IndexSet) {
        timer?.invalidate()
        fasts.remove(atOffsets: index)
    }
    
}
    

