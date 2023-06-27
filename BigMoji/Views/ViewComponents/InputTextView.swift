//
//  InputTextView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct InputTextView: View {
    
    @Binding var text:String
    @FocusState var isActive:Bool
    
    var body: some View {
        
        TextEditor(text: $text)
            .frame(height:180)
            .frame(maxHeight: 180)
            .cornerRadius(10)
            .font(.title)
            .focused($isActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("閉じる") {
                        isActive = false
                    }.foregroundColor(.thema)
                }
            }
    }
}
