//
//  SelectFamilyView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/28.
//

import SwiftUI

struct SelectFamilyView: View {
    
    @Binding var design:Font
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(FontFamilys.allCases){ design in
                Button {
                    self.design = design.design
                } label: {
                    Text(design.rawValue)
                        .frame(width:120,height: 30)
                        .foregroundColor(self.design == design.design ? .white : Color.thema)
                        .background(self.design == design.design ? Color.thema : .white)
                        .cornerRadius(30)
                        .padding(5)
                }.buttonStyle(BorderlessButtonStyle())
            }
            Spacer()
        }
        HStack{
            Spacer()
            ForEach(FontCustomFamilys.allCases){ design in
                Button {
                    self.design = design.design
                } label: {
                    Text(design.rawValue)
                        .frame(width:120,height: 30)
                        .foregroundColor(self.design == design.design ? .white : Color.thema)
                        .background(self.design == design.design ? Color.thema : .white)
                        .cornerRadius(30)
                        .padding(5)
                }.buttonStyle(BorderlessButtonStyle())
            }
            Spacer()
        }
    }
}
