//
//  FastingView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI

struct FastingView: View {
    @ObservedObject var viewModel: FastingViewModel
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Duration", selection: $viewModel.selectedDuration) {
                    Text("15 Seconds").tag(FastingDuration.hours1)
                    Text("8 Hours").tag(FastingDuration.hours8)
                    Text("12 Hours").tag(FastingDuration.hours12)
                    Text("24 Hours").tag(FastingDuration.hours24)
                    Text("36 Hours").tag(FastingDuration.hours36)
                    Text("48 Hours").tag(FastingDuration.hours48)
                }
                .pickerStyle(.inline)
                
                Button("Start Fasting") {
                    viewModel.startFasting()
                }
                
                Text("\(viewModel.elapsedTimeFormatted)")
                    .padding()
                    .onReceive(viewModel.$elapsedTime) { newElapstedTime in
                    }
                
                
                List {
                    ForEach(viewModel.fasts) { fastingPeriod in
                        Text("\(fastingPeriod.startDate) - \(fastingPeriod.endDate)")
                    }
                    
                    .onDelete { index in
                        viewModel.deleteFasting(at: index)
                    }
                }
            }
            .navigationBarTitle("Fasting Tracker")
        }
    }
}
            
   
        
    

    
    extension FastingViewModel {
        var elapsedTimeFormatted: String {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .abbreviated
            
            return formatter.string(from: elapsedTime) ?? "00:00:00"
        }
    }




//struct FastingView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    FastingView()
    //}//
//}
