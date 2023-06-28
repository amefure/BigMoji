//
//  SelectWeightView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/28.
//

import SwiftUI

struct SelectWeightView: View {
    
    @Binding var weight:FontWeights
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(FontWeights.allCases){ weight in
                Button {
                    self.weight = weight
                } label: {
                    Text(weight.rawValue)
                        .frame(width:100,height: 30)
                        .foregroundColor(self.weight == weight ? .white : Color.thema)
                        .background(self.weight == weight ? Color.thema : .white)
                        .cornerRadius(30)
                        .padding(5)
                }.buttonStyle(BorderlessButtonStyle())
            }
            Spacer()
        }
    }
}
