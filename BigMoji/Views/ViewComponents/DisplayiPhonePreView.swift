//
//  DisplayiPhonePreView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct DisplayiPhonePreView: View {
    
    private let deviceSizeVM = DeviceSizeViewModel()
    
    let text:String
    let selectedTextColor:SelectColors
    let selectedBackColor:SelectColors
    let weight:FontWeights
    let design:FontFamilys
    
    var body: some View {
        ZStack{
            
            Text(text)
                .fontWeight(weight.weight)
                .font(.system(.title,design:design.design))
                .padding(20)
                .frame(width: 330,height: 140)
                .font(.system(size: 110))
                .minimumScaleFactor(0.1)
                .multilineTextAlignment(.center)
                .foregroundColor(selectedTextColor.color)
                .lineLimit(7)
                .offset(y:deviceSizeVM.isLandscape || deviceSizeVM.isSESize ?  5 : 30)
                .zIndex(1)
            
            RoundedRectangle(cornerRadius: 60)
                .fill(Color(hexString: "#333333"))
                .frame(width: 40,height: 10)
                .rotationEffect(Angle(degrees: 90))
                .multilineTextAlignment(.trailing)
                .zIndex(2)
                .offset(x: 330 / 2 - 15 ,y: deviceSizeVM.isLandscape || deviceSizeVM.isSESize ?  5 : 30)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hexString: "#333333"),lineWidth: 10)
                .frame(width: 330 ,height: 150)
                .background(selectedBackColor.color)
                .cornerRadius(25)
                .padding(10)
                .padding(.top, deviceSizeVM.isLandscape ? 5 : deviceSizeVM.isSESize ? 20 : 70)
                .shadow(radius: 5)
        }
    }
}

