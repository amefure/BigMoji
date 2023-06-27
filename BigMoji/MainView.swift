//
//  MainView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct MainView: View {
    
    @State var text:String = ""
    
    var body: some View {
        AvailableNavigationStack {
            VStack{
                
                Spacer()
                
                VStack{
                    
                    Spacer()
                   
                    
                    TextField("ここに文字を入力してね",text: $text)
                        .frame(height: 30)
                        .textFieldStyle(.roundedBorder)
                        .font(.title)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: DisplayTextView(text: text)) {
                        Image(systemName: "iphone")
                            .padding()
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    
                }.padding()
                    .background(Color.list)
                    .cornerRadius(20)
                    .padding(.top,90)
                    
            }.ignoresSafeArea()
            .background(Color.thema)
        }
    }
}


