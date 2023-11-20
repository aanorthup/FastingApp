//
//  DataView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI
import Charts

struct DataView: View {
    @ObservedObject var weightViewModel: WeightViewModel
    @ObservedObject var fastingViewModel: FastingViewModel
    
    
    
    var body: some View {
        Text("Charts")
        
        if !weightViewModel.weightRecords.isEmpty {
            Chart{
                ForEach(weightViewModel.weightRecords, id: \.id) { item in
                    LineMark(
                        x: .value("Date", item.date),
                        y: .value("Weight", item.weight)
                    )
                }
            }
        }else {
            Text("No Weights Records")
            }
        
        if !fastingViewModel.completedFasts.isEmpty {
            Chart{
                ForEach(fastingViewModel.completedFasts, id: \.id) { item in
                    BarMark(
                        x: .value("Date", item.startDate),
                        y: .value("Weight", item.duration.duration)
                    )
                }
            }
        }else {
            Text("No Fasts Completed")
            }
        
    }
}


