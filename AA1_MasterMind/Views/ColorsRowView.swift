//
//  ColorsRowView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 12/03/2021.
//

import SwiftUI

struct ColorsRowView: View {
    let action: (Int) -> Void
    var body: some View {
        HStack {
            ForEach(0..<colEnumToCol.count) { i in
                CircleBut(color: colEnumToCol[i],
                          action: { action(i) },
                          size: 50, disabled: false)
            }
        }
    }
}

struct ColorsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsRowView(action: {_ in })
    }
}
