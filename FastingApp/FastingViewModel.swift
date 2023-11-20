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
    @Published var startTime: Date {
        didSet {
                endTime = startTime.addingTimeInterval(selectedDuration.duration)
        }
        
    }
    @Published var endTime: Date
    @Published var extraTime: Date?
    @Published var elapsedTime: Double = 0.0
    @Published var progress: Double = 0.0
    
    var fastingTime: Double {
        return fastingDuration.duration
    }
    
    var feedingTime: Double {
        return (24 - fastingDuration.duration)
    }
    
    init() {
        let calendar = Calendar.current
        
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingDuration.hours1.duration)
    }
    
    func toggleFasting() {
        if fastDone {
            let additionalTime = calculateExtraTime()
            
            endTime = endTime.addingTimeInterval(additionalTime)
            
            extraTime = nil
            elapsedTime = 0.0
            progress = 0.0
        } else {
            startTime = Date()
            elapsedTime = 0.0
            progress = 0.0
        }
    
        fastingState = fastingState == .fasting ? .notStarted : .fasting
    }
    
    func track() {
        guard fastingState != .notStarted else { return }
        
        if endTime >= Date()  {
            fastDone = false
        } else if endTime < Date() {
            fastDone = true
            
            let completedFast = FastingModel(startDate: startTime, duration: fastingDuration, endDate: endTime)
            completedFasts.append(completedFast)
            
        }
        elapsedTime += 1
        progress = (elapsedTime / fastingTime * 100).rounded() / 100

    }
    
    
    func calculateExtraTime() -> TimeInterval {
        guard let startTime = extraTime else {
            return 0
        }
        return Date().timeIntervalSince(startTime)
    }
    
    func updateTimer() {
        
        if fastingState == .fasting {
            endTime = startTime.addingTimeInterval(fastingDuration.duration)
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
    

