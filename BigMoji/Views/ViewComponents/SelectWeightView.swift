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
                    self.weight = weight.weight
                } label: {
                    Text(weight.rawValue)
                }
            }
            Spacer()
        }
    }
}
