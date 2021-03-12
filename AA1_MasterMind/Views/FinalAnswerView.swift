//
//  FinalAnswerView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 12/03/2021.
//

import SwiftUI

struct FinalAnswerView: View {
    @ObservedObject var finalAnswer: FinalAnswerModel
    
    var body: some View {
        HStack {
            ForEach(0..<finalAnswer.colors.count) { i in
                Circle()
                    .fill(finalAnswer.colors[i])
                    .frame(width: 40, height: 40)
            }
        }
    }
}

struct FinalAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        FinalAnswerView(finalAnswer: FinalAnswerModel())
    }
}
