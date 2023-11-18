//
//  FastingViewModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation


enum FastingState {
    case notStarted
    case fasting
    case feeding
}

class FastingViewModel: ObservableObject {
    @Published var fastingState: FastingState = .notStarted
    @Published var selectedDuration: FastingDuration?
    @Published var fastingDuration: FastingDuration = .hours1
    @Published var startTime: Date {
        didSet {
            
        }
        
    }
    @Published var endTime: Date
    
    var fastingTime: Double {
        return fastingDuration.duration
    }
    
    var feedingTme: Double {
        return 24 - fastingDuration.duration
    }
    
    init() {
        let calendar = Calendar.current
        
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingDuration.hours1.duration)
    }
    
    func toggleFasting() {
        startTime = Date()
        fastingState = fastingState == .fasting ? .feeding : .fasting
    }
    
    //var timer: Timer?
    
   // func startFasting() {
  //      guard let selectedDuration = selectedDuration else {
 //           return
//        }
//        let startDate = Date()
//        let fastingPeriod = FastingModel(startDate: startDate, duration://selectedDuration)
//fasts.append(fastingPeriod)
        
  //      timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
 //           self?.updateElapsedTime()
///self?.objectWillChange.send()
  //      }
        
        
  //  }
    
  //  private func updateElapsedTime() {
   //     DispatchQueue.main.async { [weak self] in
  //          guard let currentFasting = self?.fasts.last else {
   //             return
   //         }
            
 //           self?.elapsedTime = Date().timeIntervalSince(currentFasting.startDate)
            
  //          if let elapsedTime = self?.elapsedTime, elapsedTime >= currentFasting.duration.duration {
  //              self?.timer?.invalidate()
//            }
  //      }
  //  }
 
 //   func deleteFasting(at index: IndexSet) {
  //      timer?.invalidate()
//fasts.remove(atOffsets: index)
//}
    
}
    

