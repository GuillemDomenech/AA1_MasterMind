//
//  ResponseModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 10/03/2021.
//

import Foundation
import SwiftUI

class ResponseModel: ObservableObject {
    @Published var colors = [Color("gray"), Color("gray"), Color("gray"), Color("gray")]
    
    func setResponse(correctCol: Int, correctColAndPos: Int) {
        var correctCol = correctCol
        var correctColAndPos = correctColAndPos
        
        for i in 0..<colors.count {
            if correctCol > 0 {
                self.colors[i] = Color("ans_1")
                correctCol -= 1
            }
            else if correctColAndPos > 0 {
                self.colors[i] = Color("ans_2")
                correctColAndPos -= 1
            }
        }
    }
    
    func printColors() {
        print(colors)
    }
    
    func resetColors() {
        colors = [Color("gray"), Color("gray"), Color("gray"), Color("gray")]
    }
}
