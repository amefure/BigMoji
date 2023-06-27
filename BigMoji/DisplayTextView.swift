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
    
    var body: some View {
        
        Text(text)
            .font(.system(size: 400))
            .minimumScaleFactor(0.1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(selectedTextColor.color)
            .ignoresSafeArea()
            .padding()
    }
}
