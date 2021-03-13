//
//  ResultsView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 13/03/2021.
//

import SwiftUI

struct ResultsView: View {
    
    @Binding var show: Bool
    @Binding var gameWon: Bool
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            if gameWon {
                Text("You won!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
            }
            else {
                    Text("You lost!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
            }
                
            
            Button(action: {
                action()
            }) {
                HStack {
                    Text("Continue")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3))
            .foregroundColor(.blue)
        }
        .padding(.horizontal, 80)
        .padding(.vertical, 30)
        .background(Color("ans_1"))
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(show: .constant(false), gameWon: .constant(false), action: {})
    }
}
