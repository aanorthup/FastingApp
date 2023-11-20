//
//  CompletedFastsView.swift
//  FastingApp
//
//  Created by admin on 11/19/23.
//

import SwiftUI

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
            } .navigationTitle("Completed Fasts")
        }
    }
}


