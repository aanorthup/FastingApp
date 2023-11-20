//
//  ContentView.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FastingViewModel()
    @StateObject var weightViewModel = WeightViewModel()
        
    
    var body: some View {
        NavigationView {
            TabView {
                FastingView(viewModel: viewModel)
                    .tabItem() {
                        Image(systemName: "hourglass")
                        Text("Fast")
                    }
                WeightView(viewModel: weightViewModel)
                    .tabItem() {
                        Image(systemName:"list.clipboard" )
                    Text("Record Weight")
                    }
                CompletedFastsView(viewModel: viewModel)
                    .tabItem() {
                        Image(systemName: "checkmark.seal.fill")
                        Text("Completed Fasts")
                    }
               
                
               
                
            }
            .navigationBarTitle("Fasting App")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
            
    }
}
