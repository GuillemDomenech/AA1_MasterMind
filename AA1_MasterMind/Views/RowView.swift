//
//  RowView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 09/03/2021.
//

import SwiftUI

struct RowView: View {
    
    var rowData: RowModel
    
    private let size: CGFloat = 40.0
    
    let action: (_: Int) -> Void
    
    var body: some View {
        HStack{
            Text(String(rowData.rowIndex))
                .frame(width: 60)
                .offset(x: -10)
                .foregroundColor(.white)
            CircleBut(color: rowData.firstColor, action: { action(0) }, size: size)
            CircleBut(color: rowData.secondColor, action: { action(1) }, size: size)
            CircleBut(color: rowData.thirdColor, action: { action(2) }, size: size)
            CircleBut(color: rowData.fourthColor, action: { action(3) }, size: size)
                .padding(.trailing, 40)
            
            ResponseView(responseModel: rowData.responseModel)
        }
        
    }
    
    func viewDidLoad() {
        
    }
}

struct CircleBut: View {
    let color: Color
    let action: () -> Void
    let size: CGFloat
    var body: some View {
        Button(action: {
                    action()
                    }) {
                    Text("")
                        .frame(width: size, height: size)
                        .background(color)
                        .clipShape(Circle())
        }

    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(rowData: RowModel(rowIndex: 0), action: {_ in })
    }
}
