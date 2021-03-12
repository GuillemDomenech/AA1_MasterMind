//
//  FinalAnswerModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 12/03/2021.
//

import Foundation
import SwiftUI

class FinalAnswerModel: ObservableObject {
    @Published var colors = [Color("gray"), Color("gray"), Color("gray"), Color("gray")]
    
    func setAnswer(col1: Int, col2: Int, col3: Int, col4: Int) {
        colors[0] = colEnumToCol[col1]
        colors[1] = colEnumToCol[col2]
        colors[2] = colEnumToCol[col3]
        colors[3] = colEnumToCol[col4]
    }
    
    func resetColors() {
        colors = [Color("gray"), Color("gray"), Color("gray"), Color("gray")]
    }
}
