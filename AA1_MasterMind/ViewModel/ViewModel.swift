//
//  ViewModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 09/03/2021.
//

import Foundation
import SwiftUI



class ViewModel: ObservableObject {
    
    @Published var rowsList: [RowModel] = [
        RowModel(rowIndex: 1),
        RowModel(rowIndex: 2),
        RowModel(rowIndex: 3),
        RowModel(rowIndex: 4),
        RowModel(rowIndex: 5),
        RowModel(rowIndex: 6),
        RowModel(rowIndex: 7),
        RowModel(rowIndex: 8),
        RowModel(rowIndex: 9),
        RowModel(rowIndex: 10),
        RowModel(rowIndex: 11),
        RowModel(rowIndex: 12),
    ]
    
    init() {
        //rowsList[10].rowIndex = 80
    }
    
    func buttonPressed(rowIdx: Int, colIdx: Int) -> Void {
        print("Button \(rowIdx), \(colIdx) pressed!")
    }
    func buttonPressed(colIdx: Int) -> Void {
        print("Button \(colIdx) pressed!")
    }
    
}
