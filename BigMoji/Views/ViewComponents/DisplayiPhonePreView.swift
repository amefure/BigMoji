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
                .frame(width: UIScreen.main.bounds.width - 60,height: 140)
                .font(.system(size: 110))
                .minimumScaleFactor(0.1)
                .multilineTextAlignment(.center)
                .foregroundColor(selectedTextColor.color)
                .lineLimit(7)
                .offset(y:30)
                .zIndex(1)
            
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 50,height: 15)
                .rotationEffect(Angle(degrees: 90))
                .multilineTextAlignment(.trailing)
                .zIndex(2)
                .offset(x:UIScreen.main.bounds.width / 2 - 45 ,y:30)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hexString: "#333333"),lineWidth: 10)
                .frame(width: UIScreen.main.bounds.width - 60,height: 150)
                .background(selectedBackColor.color)
                .cornerRadius(25)
                .padding(10)
                .padding(.top,70)
                .shadow(radius: 5)
        }
    }
}

