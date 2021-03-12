//
//  ResponseView.swift
//  AA1_MasterMind
//
//  Created by Guillem Domènech Rofín on 10/03/2021.
//

import SwiftUI

struct ResponseView: View {
    
    @ObservedObject var responseModel: ResponseModel
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(responseModel.colors[0])
                    .frame(width: 15, height: 15)
                Circle()
                    .fill(responseModel.colors[1])
                    .frame(width: 15, height: 15)
            }
            HStack {
                Circle()
                    .fill(responseModel.colors[2])
                    .frame(width: 15, height: 15)
                Circle()
                    .fill(responseModel.colors[3])
                    .frame(width: 15, height: 15)
            }
        }
    }
}

struct ResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseView(responseModel: ResponseModel())
    }
}
