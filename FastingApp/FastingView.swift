//
//  FastingView.swift
//  FastingApp
//
//  Created by admin on 11/15/23.
//

import SwiftUI

struct FastingView: View {
    @StateObject var viewModel: FastingViewModel
    
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
                Text(title)
                
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
