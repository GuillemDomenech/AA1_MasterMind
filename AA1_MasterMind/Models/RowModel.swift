//
//  RowModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 10/03/2021.
//

import Foundation
import SwiftUI

struct RowModel {
    var firstColor: Color = Color("gray")
    var secondColor: Color = Color("gray")
    var thirdColor: Color = Color("gray")
    var fourthColor: Color = Color("gray")
    
    let responseModel: ResponseModel = ResponseModel()
    
    var rowIndex: Int
    
}
