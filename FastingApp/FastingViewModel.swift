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
    @Published var selectedDuration: FastingDuration? {
        didSet {
            if let selectedDuration = selectedDuration {
                fastingDuration = selectedDuration
                updateTimer()
            }
        }
    }
    @Published var fastingDuration: FastingDuration = .hours1
    @Published var fastDone: Bool = false
    @Published var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
        
    }
    @Published var endTime: Date
    
    var fastingTime: Double {
        return fastingDuration.duration * 60 * 60
    }
    
    var feedingTime: Double {
        return (24 - fastingDuration.duration) * 60 * 60
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
    
    func track() {
        if endTime >= Date() {
            fastDone = false
        } else {
            fastDone = true
        }
    }
    
    func updateTimer() {
        if fastingState == .fasting {
            endTime = startTime.addingTimeInterval(fastingTime)
        } else {
            endTime = startTime.addingTimeInterval(feedingTime)
        }
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
    

