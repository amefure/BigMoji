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
    @State var weight:FontWeights = .light
    
    var body: some View {
        AvailableNavigationStack {
            VStack(spacing:0){
                
                DisplayiPhonePreView(text: text, selectedTextColor: selectedTextColor, selectedBackColor:selectedBackColor, weight: weight)
                
                List{
                    
                    Section("Text"){
                        InputTextView(text: $text)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    Section("テキストカラー"){
                        ScrollSelectColorsView(selectedColor: $selectedTextColor)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section("バックカラー"){
                        ScrollSelectColorsView(selectedColor: $selectedBackColor)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section("フォント"){
                        
                        SelectWeightView(weight: $weight)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    
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
                                DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor, weight: weight)
                            }.listRowBackground(Color.clear).listRowSeparator(.hidden)
                        }else{
                            NavigationLink(isActive: $isPresented) {
                                DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor, weight: weight)
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
                    .padding(.top,20)
                    .listStyle(.grouped)
                    .shadow(color: Color.list,radius: 0, x: 0, y: 15)
                
                AdMobBannerView().frame(height: 60)
                
            }.ignoresSafeArea() // VStack
                .background(Color.thema)
            
        }.tint(.thema) // AvailableNavigationStack
    }
}


