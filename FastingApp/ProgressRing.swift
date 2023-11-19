//
//  ProgressRing.swift
//  FastingApp
//
//  Created by admin on 11/19/23.
//

import SwiftUI

struct ProgressRing: View {
    @State var progress = 0.0
    @ObservedObject var viewModel: FastingViewModel
    
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
        ZStack {
            // MARK: Placehold ring
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            //MARK: Colored ring
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(.red), Color(.yellow), Color(.green)]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                // MARK: Elapsed Time
                
                VStack(spacing: 5) {
                    Text("Elapsed Time")
                    
                    Text("0:00")
                        .font(.title)
                }
                
                VStack(spacing: 5) {
                    if !viewModel.fastDone {
                        Text("Remaining Time: ")
                    } else {
                        Text("Extra Time")
                    }
                    Text(title)
                    
                    Text(viewModel.startTime, style: .timer)
                    
                    Text(viewModel.endTime, style: .timer)
                    
                    
                }
                
            }
            
        }
        .frame(width: 350, height: 350)
        .padding()
        .onAppear {
            progress = 1
        }    }
}

