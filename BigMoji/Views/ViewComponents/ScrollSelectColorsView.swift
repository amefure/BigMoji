//
//  ScrollSelectColorsView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct ScrollSelectColorsView: View {
    
    private let deviceSizeVM = DeviceSizeViewModel()
    private let UserDefaultsVM = UserDefaultsViewModel()
    
    @Binding var selectedColor:SelectColors
    @State var customColor:Color = .thema
    
    public var isBackCall:Bool = false
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack{
                ForEach(SelectColors.allCases) { color in
                    if color != .custom {
                        Button {
                            selectedColor = color
                        } label: {
                            color.color
                                .cornerRadius(30)
                                .frame(width:25,height: 25)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(selectedColor == color ? Color.thema : .white,lineWidth: 3)
                                }
                                .padding(5)
                        }
                    }
                }
                ColorPicker("色の選択", selection: $customColor)
                    .labelsHidden()
                    .onChange(of: customColor) { newColor in
                        selectedColor = .white
                        selectedColor = .custom
                        if !isBackCall {
                            UserDefaultsVM.setFontColor(color: newColor.toHexString())
                        }else{
                            UserDefaultsVM.setBackColor(color: newColor.toHexString())
                        }
                    }
            }
        }.frame(height: deviceSizeVM.isSESize ? 35 : 40)
    }
}
