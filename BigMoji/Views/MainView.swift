//
//  MainView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var interstitial = AdmobInterstitialView()
    @ObservedObject private var rootViewModel = RootViewModel.shared
    
    @State var text:String = ""
    @State var isPresented:Bool = false
    @State var selectedTextColor:SelectColors = SelectColors.black
    @State var selectedBackColor:SelectColors = SelectColors.white
    @State var weight:FontWeights = .light
    @State var design:Font = FontFamilys.rounded.design
    @State var errorAlert = false
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        AvailableNavigationStack {
            VStack(spacing:0){
                
                DisplayiPhonePreView(text: text, selectedTextColor: selectedTextColor, selectedBackColor:selectedBackColor, weight: weight,design: design)
                
                List{
                    
                    Section(L10n.fieldNameText){
                        InputTextView(text: $text)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    Section(L10n.fieldNameTextColor){
                        ScrollSelectColorsView(selectedColor: $selectedTextColor)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section(L10n.fieldNameBackColor){
                        ScrollSelectColorsView(selectedColor: $selectedBackColor,isBackCall:true)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section(L10n.fieldNameFont){
                        SelectWeightView(weight: $weight)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section(L10n.fieldNameDesign){
                        SelectFamilyView(design: $design)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    Section(L10n.fieldNameDesign2){
                        SelectCustomFamilyView(design: $design)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    
                    HStack{
                        
                        Spacer()
                        
                        
                        if #available(iOS 16.0, *) {
                            Button {
                                if !text.isEmpty {
                                    rootViewModel.addCountInterstitial()
                                    if rootViewModel.countInterstitial == 3 {
                                        rootViewModel.countInterstitial = 0
                                        interstitial.presentInterstitial()
                                    }
                                    isPresented = true
                                } else {
                                    errorAlert = true
                                }
                            } label: {
                                Text(L10n.showButton)
                                    .padding()
                                    .frame(width:100)
                                    .background(Color.thema)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }.navigationDestination(isPresented: $isPresented) {
                                    DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor, weight: weight,design: design)
                                }.listRowBackground(Color.clear).listRowSeparator(.hidden)
                        }else{
                            ZStack {
                                Button {
                                    if !text.isEmpty {
                                        rootViewModel.addCountInterstitial()
                                        if rootViewModel.countInterstitial == 3 {
                                            rootViewModel.countInterstitial = 0
                                            interstitial.presentInterstitial()
                                        }
                                        isPresented = true
                                    } else {
                                        errorAlert = true
                                    }
                                } label: {
                                    Text(L10n.showButton)
                                        .padding()
                                        .frame(width:100)
                                        .background(Color.thema)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                                NavigationLink(isActive: $isPresented) {
                                    DisplayTextView(text: text, selectedTextColor: selectedTextColor,selectedBackColor:selectedBackColor, weight: weight,design: design)
                                } label: {
                                    EmptyView()
                                }.hidden()
                            }
                        }
                        
                        Spacer()
                        
                    }.listRowBackground(Color.clear) // HStack
                        .listRowSeparator(.hidden)
                    
                }.cornerRadius(20) // List
                    .padding(.top,20)
                    .listStyle(.grouped)
                    .shadow(color: colorScheme == .dark ? .black : Color.list,radius: 0, x: 0, y: 15)
                
                AdMobBannerView().frame(height: 60)
                
            }.ignoresSafeArea() // VStack
                .background(Color.thema)
                .onAppear {
                    interstitial.loadInterstitial()
                }
                .alert(Text(L10n.emptyAlertTitle),
                       isPresented: $errorAlert,
                       actions: {
                    Button(action: {}, label: {
                        Text("OK")
                    })
                })
            
        }.tint(.thema) // AvailableNavigationStack
    }
}


