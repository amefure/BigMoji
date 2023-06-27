//
//  MainView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct MainView: View {
    
    @State var text:String = ""
    @State var isPresented:Bool = false
    @State var selectedTextColor:SelectColors = SelectColors.black
    @State var selectedBackColor:SelectColors = SelectColors.white

    
    var body: some View {
        AvailableNavigationStack {
            VStack{
                
                DisplayiPhonePreView(text: text, selectedTextColor: selectedTextColor, selectedBackColor:selectedBackColor)
                
                List{
                    
                    Section("Text"){
                        InputTextView(text: $text)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    Section("テキストカラー"){
                        ScrollSelectColorsView(selectedColor: $selectedTextColor)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    Section("バックカラー"){
                        ScrollSelectColorsView(selectedColor: $selectedBackColor)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    
                    HStack{
                        
                        Spacer()
                        
                        if #available(iOS 16.0, *) {
                            Button {
                                if !text.isEmpty{
                                    isPresented = true
                                }
                            } label: {
                                Text("SHOW")
                                    .padding()
                                    .frame(width:100)
                                    .background(Color.thema)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }.navigationDestination(isPresented: $isPresented) {
                                DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor)
                            }.listRowBackground(Color.clear).listRowSeparator(.hidden)
                        }else{
                            NavigationLink(isActive: $isPresented) {
                                DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor)
                            } label: {
                                Text("Show")
                                    .padding()
                                    .frame(width:100)
                                    .background(Color.thema)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        Spacer()
                        
                    }.listRowBackground(Color.clear) // HStack
                        .listRowSeparator(.hidden)
                    
                }.cornerRadius(20) // List
                    .listStyle(.grouped)
                
            }.ignoresSafeArea() // VStack
                .background(Color.thema)
            
        } // AvailableNavigationStack
    }
}


