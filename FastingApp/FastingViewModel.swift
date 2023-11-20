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
}

class FastingViewModel: ObservableObject {
    @Published var completedFasts: [FastingModel] = []
    @Published var fastingState: FastingState = .notStarted
    @Published var selectedDuration: FastingDuration = .hours1 {
        didSet {
            fastingDuration = selectedDuration
            updateTimer()
        }
    }
    @Published var fastingDuration: FastingDuration = .hours1
    @Published var fastDone: Bool = false
    @Published var startTime: Date
    @Published var isFastingComplete: Bool = false
    @Published var endTime: Date
    @Published var extraTime: Date?
    @Published var elapsedTime: Double = 0.0
    @Published var progress: Double = 0.0
    
    var fastingTime: Double {
        return fastingDuration.duration
    }
    
    var feedingTime: Double {
        return 24 - fastingDuration.duration
    }
    
    
    init() {
        let calendar = Calendar.current
        let components = DateComponents(hour: 20)
        guard let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime) else {
            fatalError("Unable to calculate scheduled time.")
        }
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingDuration.hours1.duration)
    }
    
    func toggleFasting() {
        isFastingComplete = fastDone
        elapsedTime = 0.0
        progress = 0.0
        startTime = Date()
        updateTimer()
    
        fastingState = fastingState == .fasting ? .notStarted : .fasting
        
        
    }
    
    func track() {
        guard fastingState != .notStarted else { return }
        
        if endTime >= Date()  {
            fastDone = false
        } else if endTime < Date() {
            fastDone = true
            
            if !isFastingComplete {
                let completedFast = FastingModel(startDate: startTime, duration: fastingDuration, endDate: endTime)
                completedFasts.append(completedFast)
                isFastingComplete = true
            
            }
                updateTimer()

        }
        elapsedTime += 1
        progress = (elapsedTime / fastingTime * 100).rounded() / 100

    }
    
    
   // func calculateExtraTime() -> TimeInterval {
   //     guard let startTime = extraTime else {
 //           return 0
   //     }
 //       return Date().timeIntervalSince(startTime)
//}
    
    func updateTimer() {
        endTime = startTime.addingTimeInterval(fastingDuration.duration)
        
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
    

