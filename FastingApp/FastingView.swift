//
//  FastingView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI

struct FastingView: View {
    @StateObject var viewModel: FastingViewModel
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var title: String {
        switch viewModel.fastingState {
        case .notStarted:
            return "Not Fasting"
        case .fasting:
            return "Fasting"
        case .feeding:
           return "Feeding"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.fastDone {
                    Text("Remaining Time: ")
                } else {
                    Text("Extra Time")
                }
                Text(title)
                
                Text(viewModel.startTime, style: .timer)
                
                Text(viewModel.endTime, style: .timer)
                
                Button {
                    viewModel.toggleFasting()
                } label: {
                    Text(viewModel.fastingState == .fasting ? "End Fast" : "Start Fast")
                        .font(.title3)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                
            }
                
                .onReceive(timer) { _ in 
                    viewModel.track()
                }
            
            }
        }
    }
}
   
        
    




//struct FastingView_Previews: PreviewProvider {
//static var previews: some View {
//FastingView(viewModel: viewModel)
//    }
//}
