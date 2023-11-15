//
//  ContentView.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                FastingView()
                    .tabItem() {
                        Image(systemName: "hourglass")
                        Text("Fast")
                    }
                WeightView()
                    .tabItem() {
                        Image(systemName:"list.clipboard" )
                    Text("Record Weight")
                    }
                DataView()
                    .tabItem() {
                        Image(systemName: "chart.line.downtrend.xyaxis")
                        Text("Progress")
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
