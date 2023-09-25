//
//  RootViewModel.swift
//  BigMoji
//
//  Created by t&a on 2023/09/23.
//

import SwiftUI

class RootViewModel: ObservableObject {
    
    static let shared = RootViewModel()
    private let UserDefaultsVM = UserDefaultsViewModel()
    
    // 広告表示カウント
    @Published var countInterstitial:Int = 0 // 初期値
    
    
    public func addCountInterstitial() {
        countInterstitial += 1
        UserDefaultsVM.setCountInterstitial(countInterstitial)
    }
    
    public func getCountInterstitial() {
        countInterstitial = UserDefaultsVM.getCountInterstitial()
    }
}

