//
//  ScrollSelectColorsView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct ScrollSelectColorsView: View {
    
    @Binding var selectedColor:SelectColors
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack{
                ForEach(SelectColors.allCases) { color in
                    Button {
                        selectedColor = color
                    } label: {
                        color.color
                            .cornerRadius(30)
                            .frame(width:30,height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(selectedColor == color ? Color.thema : .white,lineWidth: 3)
                            }
                            .padding(5)
                    }
                }
            }
        }
    }
}
