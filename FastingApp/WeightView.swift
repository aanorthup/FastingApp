//
//  WeightView.swift
//  FastingApp
//
//  Created by admin on 11/13/23.
//

import SwiftUI
import Charts

struct WeightView: View {
    @ObservedObject var viewModel = WeightViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter Weight:", text: $viewModel.weightInput)
                //.keyboardType(.decimalPad)
                .padding()
            
            Button("Record Weight") {
                viewModel.addWeight()
            }
            .padding()
            
           
        } .padding()
        }
    }


struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
            .previewDevice("iPhone 14")
    }
}
