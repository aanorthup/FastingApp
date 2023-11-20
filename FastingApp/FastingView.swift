//
//  FastingView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI

struct FastingView: View {
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
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text(title)
                
                Picker("Select Fasting Duration", selection: $viewModel.selectedDuration) {
                    ForEach(FastingDuration.allCases, id: \.self) { duration in
                        Text(duration.rawValue).tag(duration)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                    
                
                //MARK: Progress Ring
                ZStack {
                    
                    
                    Circle()
                        .stroke(lineWidth: 20)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                    
                    
                    Circle()
                        .trim(from: 0.0, to: min(viewModel.progress, 1.0))
                        .stroke(AngularGradient(gradient: Gradient(colors: [Color(.red), Color(.yellow), Color(.green)]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                        .rotationEffect((Angle(degrees: 270)))
                        .animation(.easeInOut(duration: 1.0), value: viewModel.progress)
                    
                    //MARK: Timers
                    VStack(spacing: 30) {
                        if viewModel.fastingState == .notStarted {
                            VStack(spacing: 5) {
                                
                                
                                Text("Upcoming Fast")
                                
                                Text("\(viewModel.fastingDuration.duration.formatted())")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                        } else {
                            VStack(spacing: 5) {
                                Text("Elapsed Time")
                                
                                Text(viewModel.startTime, style: .timer)
                                    .font(.title)
                            }
                            
                            VStack(spacing: 5) {
                                if !viewModel.fastDone {
                                    Text("Remaining Time: ")
                                } else {
                                    Text("Extra Time: ")
                                }
                                
                                Text(viewModel.endTime, style: .timer)
                                
                                                            
                                
                            }
                        }
                                                
                    }
                    
                }
                .frame(width: 350, height: 350)
                .padding()
        
                .onReceive(timer) { _ in
                    viewModel.track()
                }
                //MARK: Times and Button
                
                HStack(spacing: 40) {
                    
                    VStack {
                        Text(viewModel.fastingState == .notStarted ? "Start" : "Started")
                        Text(viewModel.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                        
                        Text(viewModel.fastingState == .notStarted ? "End" : "Ends")
                        Text(viewModel.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                        
                        
                    }
                }
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
                    
                    
                    
                }
            }
        }
    
}

   
        
    




//struct FastingView_Previews: PreviewProvider {
//static var previews: some View {
//FastingView(viewModel: viewModel)
//    }
//}
