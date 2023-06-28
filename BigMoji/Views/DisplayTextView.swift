//
//  ContentView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct DisplayTextView: View {
    
    let text:String
    let selectedTextColor:SelectColors
    let selectedBackColor:SelectColors
    let weight:FontWeights
    let design:Font
    
    var body: some View {
        
        Text(text)
            .fontWeight(weight.weight)
            .font(design)
            .font(.system(size: 400))
            .minimumScaleFactor(0.1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(selectedTextColor != .custom ? selectedTextColor.color : Color(hexString:UserDefaultsViewModel().getFontColor()))
            .padding()
            .background(selectedBackColor != .custom ? selectedBackColor.color : Color(hexString: UserDefaultsViewModel().getBackColor()))
    }
}
