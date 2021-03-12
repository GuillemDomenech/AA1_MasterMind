//
//  RowModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 10/03/2021.
//

import Foundation
import SwiftUI

class RowModel: ObservableObject {
    @Published var colors:[Int?] = [nil, nil, nil, nil]
//    var firstColor: Color? //= Color("gray")
//    var secondColor: Color? //= Color("gray")
//    var thirdColor: Color? //= Color("gray")
//    var fourthColor: Color? //= Color("gray")
    
    @Published var disabledStates:[Bool] = [true, true, true, true]
    
    @Published var responseModel: ResponseModel = ResponseModel()
    
    var rowIndex: Int
    
    init(rowIndex: Int) {
        self.rowIndex = rowIndex
    }
    
    func disableAll() {
        disabledStates = [true, true, true, true]
    }
    func enableAll() {
        disabledStates = [false, false, false, false]
    }
    
    func getColor(idx: Int) -> Color {
        if let colIdx = colors[idx] {
            return colEnumToCol[colIdx]
        }
        else {
            return Color("gray")
        }
    }
    
}
