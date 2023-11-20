//
//  CompletedFastsView.swift
//  FastingApp
//
//  Created by admin on 11/19/23.
//

import SwiftUI
import Charts

struct CompletedFastsView: View {
    @ObservedObject var viewModel: FastingViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.completedFasts) { fast in
                    HStack {
                        Text("\(fast.duration.rawValue) hours")
                        Spacer()
                        Button(action : {
                            viewModel.completedFasts.removeAll { $0.id == fast.id}
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                            
                            
                        }
                    }
                }
            }
            VStack {
                if !viewModel.completedFasts.isEmpty {
                    Chart{
                        ForEach(viewModel.completedFasts, id: \.id) { item in
                            BarMark(
                                x: .value("Date", item.startDate),
                                y: .value("Duration", item.duration.duration)
                            )
                        }
                    }
                }else {
                    Text("No Fasts Completed")
                }
            }
            .navigationTitle("Completed Fasts")
        }
    }
}


