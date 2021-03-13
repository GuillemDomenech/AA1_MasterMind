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
                ZStack {
                    Text("MasterMind")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Button(action: {
                        viewModel.RestartGame()
                    }, label: {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.title)
                                .accentColor(.white)
                    })
                    .offset(x: -150)
                }
                
                VStack {
                    Text("Solution: ")
                        .foregroundColor(.white)
                    FinalAnswerView(finalAnswer: viewModel.finalAnswer)
                }
                .padding(.vertical, 10)
                
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
                ColorsRowView(action: viewModel.colorButtonPressed)
                    .padding(.vertical, 20)
            }
            
            if viewModel.showWelcomePopUp {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        WelcomeView(show: $viewModel.showWelcomePopUp)
                            .offset(y: -150)
                        Spacer()
                    }
                    Spacer()
                }
                .background(Color.black.opacity(0.65))
                .zIndex(2)
            }
            
            if viewModel.showResultsPopUp {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        ResultsView(show: $viewModel.showResultsPopUp, gameWon: $viewModel.gameWon, action: viewModel.RestartGame)
                            .offset(y: -150)
                        Spacer()
                    }
                    Spacer()
                }
                .background(Color.black.opacity(0.65))
                .zIndex(3)
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
