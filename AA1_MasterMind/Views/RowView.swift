//
//  RowView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 09/03/2021.
//

import SwiftUI

struct RowView: View {
    
    @ObservedObject var rowData: RowModel
    
    private let size: CGFloat = 40.0
    
    let action: (_: Int) -> Void
    
    var body: some View {
        HStack{
            Text(String(rowData.rowIndex))
                .frame(width: 60)
                .offset(x: -10)
                .foregroundColor(.white)
            ForEach(0..<rowData.colors.count) { i in
                CircleBut(color: rowData.getColor(idx: i), action: { action(i) }, size: size, disabled: rowData.disabledStates[i])
            }
            
            ResponseView(responseModel: rowData.responseModel)
                .padding(.leading, 40)
        }
        
    }
    
    func viewDidLoad() {
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(rowData: RowModel(rowIndex: 0), action: {_ in })
    }
}
