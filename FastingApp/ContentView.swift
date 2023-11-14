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
            VStack {
                Color.white
                    .ignoresSafeArea()
                
                NavigationLink(destination: WeightView()) {
                    Text("Record Your Weight")
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
