//
//  WelcomeView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 12/03/2021.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var show: Bool
    
    var body: some View {        
        VStack {
            Text("Welcome to MasterMind!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40)
            Text("Press Play to start the game!")
                .padding(.bottom, 40)
            
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }) {
                HStack {
                    Text("Play")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3))
            .foregroundColor(.blue)
        }
        .padding()
        .background(Color("ans_1"))
        .cornerRadius(15)
        .shadow(radius: 10)
    }
        
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(show: .constant(false))
    }
}
