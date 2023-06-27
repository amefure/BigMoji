//
//  DisplayiPhonePreView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct DisplayiPhonePreView: View {
    
    let text:String
    let selectedTextColor:SelectColors
    let selectedBackColor:SelectColors
    
    var body: some View {
        ZStack{
            
            Text(text)
                .padding(20)
                .frame(width: 330,height: 140)
                .font(.system(size: 110))
                .minimumScaleFactor(0.1)
                .multilineTextAlignment(.center)
                .foregroundColor(selectedTextColor.color)
                .lineLimit(7)
                .offset(y:UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight ?  10 : 30)
                .zIndex(1)
            
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 40,height: 10)
                .rotationEffect(Angle(degrees: 90))
                .multilineTextAlignment(.trailing)
                .zIndex(2)
                .offset(x: 330 / 2 - 15 ,y: UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight ?  10 : 30)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hexString: "#333333"),lineWidth: 10)
                .frame(width: 330 ,height: 150)
                .background(selectedBackColor.color)
                .cornerRadius(25)
                .padding(10)
                .padding(.top, UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight ? 20 : 70)
                .shadow(radius: 5)
        }
    }
}

