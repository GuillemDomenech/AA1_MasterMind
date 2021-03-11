//
//  ContentView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 09/03/2021.
//

import SwiftUI

// This is a model
struct row {
    let number: Int
    let color: [Color]
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color("dark_bg")
                .ignoresSafeArea(.all)
            
            VStack {
                Text("MasterMind")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                VStack {
                    ForEach(0..<viewModel.rowsList.count) { i in
                        let reversedIdx = viewModel.rowsList.count - 1 - i
                        RowView(rowData: viewModel.rowsList[reversedIdx],
                                //action: viewModel.buttonPressed)
                                action: { (columnIdx) -> () in
                                    viewModel.buttonPressed(rowIdx: reversedIdx, colIdx: columnIdx)
                                }
                                    
                        )
                    }
                }
                Spacer()
                HStack {
                    
                    Text("Tried 2 times")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                }
            }
        }
        
    }
}

extension ContentView {
    func doNothing() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
