//
//  InputTextView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct InputTextView: View {
    
    private let deviceSizeVM = DeviceSizeViewModel()
    
    @Binding var text:String
    @FocusState var isActive:Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        TextEditor(text: $text)
            .frame(height: deviceSizeVM.isLandscape ? 40 : 100)
            .frame(maxHeight:  deviceSizeVM.isLandscape ? 40 : 100)
            .cornerRadius(10)
            .font(.title)
            .focused($isActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(L10n.closeButton) {
                        isActive = false
                    }
                }
            }
            .overlay {
                if colorScheme == .dark {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray,lineWidth: 2)
                }
            }
    }
}
