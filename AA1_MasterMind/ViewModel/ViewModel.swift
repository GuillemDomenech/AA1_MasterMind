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
    
    var answer: [Int] = [0,0,0,0]
    
    var gameWon = false
    
    @Published var showWelcomePopUp = true
    
    @Published var showResultsPopUp = false
    
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
        DisableAllRowsButtons()
        StartGame()
    }
    
    func StartGame() {
        GenerateRandomAnswer()
        rowsList[0].enableAll()
    }
    
    func DisableAllRowsButtons() {
        for i in 0...rowsList.count-1 {
            rowsList[i].disableAll()
        }
    }
    
    func GenerateRandomAnswer() {
        let randCol1 = Int.random(in: 0..<4)
        let randCol2 = Int.random(in: 0..<4)
        let randCol3 = Int.random(in: 0..<4)
        let randCol4 = Int.random(in: 0..<4)
        answer = [randCol1, randCol2, randCol3, randCol4]
        print("Answer: \(answer)")
    }
    
    func showAnswer() {
        finalAnswer.setAnswer(col1: answer[0], col2: answer[1], col3: answer[2], col4: answer[3])
    }
    
    func buttonPressed(rowIdx: Int, colIdx: Int) -> Void {
        
        if rowIdx != currRowIdx {
            return
        }
        
        //print("Button \(rowIdx), \(colIdx) pressed!")
        currColSelected = colIdx
    }
    
    func colorButtonPressed(colIdx: Int) -> Void {
        //print("Color button \(colIdx) pressed!")
        
        guard let currColSelected = currColSelected else {
            return
        }
        
        rowsList[currRowIdx].colors[currColSelected] = colIdx
        
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
            gameWon = showHint()
            if !checkEndGame() {
                // Advance one row
                currRowIdx += 1
                currColSelected = nil
                DisableAllRowsButtons()
                rowsList[currRowIdx].enableAll()
            }
            else {
                if gameWon {
                    print("You won the game!")
                    showAnswer()
                    withAnimation {
                        showResultsPopUp = true
                    }
                }
                else {
                    print("You lost the game :(")
                    showAnswer()
                    withAnimation {
                        showResultsPopUp = true
                    }
                }
            }
        }
    }
    
    func showHint() -> Bool {
        var correctCol = 0
        var correctColAndPos = 0
        
        var colCountAnswer: [Int:Int] = [:]
        
        // Count how many appearances of each color in the answer
        for i in 0...answer.count-1 {
            let colIdx = answer[i]
            if let colIdxCount = colCountAnswer[colIdx] {
                colCountAnswer.updateValue(colIdxCount+1, forKey: colIdx)
            }
            else {
                colCountAnswer.updateValue(1, forKey: colIdx)
            }
        }
        
        var colCountInput: [Int:Int] = [:]
        
        for i in 0...rowsList[currRowIdx].colors.count-1 {
            let currCol: Int = rowsList[currRowIdx].colors[i]!
            let answerCol: Int = answer[i]
            
            
            if currCol == answerCol {
                let currColCount: Int = colCountInput[currCol] ?? 0
                colCountInput.updateValue(currColCount+1, forKey: currCol)
                
                correctColAndPos += 1
                continue
            }
            else {
                for colAns in answer {
                    let currColCount: Int = colCountInput[currCol] ?? 0
                    let currAnsColCount: Int = colCountAnswer[currCol] ?? 0
                    
                    if colAns == currCol && currColCount < currAnsColCount {
                        correctCol += 1
                        
                        colCountInput.updateValue(currColCount+1, forKey: currCol)
                        break
                    }
                }
            }
        }
        
        rowsList[currRowIdx].responseModel.setResponse(correctCol: correctCol, correctColAndPos: correctColAndPos)
        
        return correctColAndPos == 4
    }
    
    func checkEndGame() -> Bool {
        if gameWon {
            return true
        }
        else if currRowIdx >= 11 {
            return true
        }
        else {
            return false
        }
    }
    
    func RestartGame() {
        for row in rowsList {
            row.resetColors()
        }
        finalAnswer.resetColors()
        
        gameWon = false
        currRowIdx = 0
        currColSelected = nil
        
        DisableAllRowsButtons()
        StartGame()
        
        withAnimation {
            showResultsPopUp = false
        }
    }    
}
