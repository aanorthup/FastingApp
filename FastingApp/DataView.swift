//
//  DataView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI
import Charts

struct DataView: View {
    @ObservedObject var weightViewModel = WeightViewModel
    
    
    
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
        
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
