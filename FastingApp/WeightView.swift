//
//  WeightView.swift
//  FastingApp
//
//  Created by admin on 11/13/23.
//

import SwiftUI
import Charts

struct WeightView: View {
    @ObservedObject var viewModel: WeightViewModel
    
    var body: some View {
        VStack {
            TextField("Enter Weight:", text: $viewModel.weightInput)
                //.keyboardType(.decimalPad)
                .padding()
            
            Button("Record Weight") {
                viewModel.addWeight()
            }
            .padding()
            Text("Weight History")
            
            if !viewModel.weightRecords.isEmpty {
                Chart{
                    ForEach(viewModel.weightRecords, id: \.id) { item in
                        LineMark(
                            x: .value("Date", item.date),
                            y: .value("Weight", item.weight)
                        )
                    }
                }
            }else {
                Text("No Weight Records")
                }
        } .padding()
        }
    }


