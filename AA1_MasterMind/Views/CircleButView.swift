//
//  CircleButView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 12/03/2021.
//

import SwiftUI



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
        .padding(.horizontal, 5)

    }
}

struct CircleBut_Previews: PreviewProvider {
    static var previews: some View {
        CircleBut(color: Color.red, action: {}, size: 50)
    }
}
