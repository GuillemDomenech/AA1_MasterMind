//
//  ViewModel.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 09/03/2021.
//

import Foundation
import SwiftUI



class ViewModel: ObservableObject {
    var currRowIdx = 0
    var currColSelected: Int?
    
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
    
    @Published var finalAnswer = FinalAnswerModel()
    
    init() {
        //rowsList[10].rowIndex = 80
        StartGame()
    }
    
    func StartGame() {
        GenerateRandomAnswer()
    }
    
    func GenerateRandomAnswer() {
        let randCol1 = Int.random(in: 0..<4)
        let randCol2 = Int.random(in: 0..<4)
        let randCol3 = Int.random(in: 0..<4)
        let randCol4 = Int.random(in: 0..<4)
        finalAnswer.setAnswer(col1: randCol1, col2: randCol2, col3: randCol3, col4: randCol4)
    }
    
    func buttonPressed(rowIdx: Int, colIdx: Int) -> Void {
        
        if rowIdx != currRowIdx {
            return
        }
        
        print("Button \(rowIdx), \(colIdx) pressed!")
        currColSelected = colIdx
    }
    
    func colorButtonPressed(colIdx: Int) -> Void {
        print("Color button \(colIdx) pressed!")
        
        guard let currColSelected = currColSelected else {
            return
        }
        
        rowsList[currRowIdx].colors[currColSelected] = colEnumToCol[colIdx]
        
        evaluateRow()
    }
    
    func evaluateRow() {
        var allSet = true
        
        for col in rowsList[currRowIdx].colors {
            if col == nil {
                allSet = false
                break
            }
        }
        if allSet {
            print("Row completed!")
            if !checkEndGame() {
                currRowIdx += 1
                currColSelected = nil
                
                // Update response colors
            }
        }
    }
    
    func checkEndGame() -> Bool {
        return false	
    }
    
    func RestartGame() {
        
    }
    
}
