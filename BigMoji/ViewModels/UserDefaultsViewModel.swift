//
//  UserDefaultsViewModel.swift
//  BigMoji
//
//  Created by t&a on 2023/06/29.
//

import SwiftUI

class UserDefaultsViewModel {
    
    private let userDefault = UserDefaults.standard
        
    public func setFontColor(color:String){
        userDefault.set(color, forKey: "CustomFontColor")
    }
    
    public func setBackColor(color:String){
        userDefault.set(color, forKey: "CustomBackColor")
    }
    
    public func getFontColor() -> String{
        userDefault.object(forKey: "CustomFontColor") as! String
    }
    
    public func getBackColor() -> String{
        userDefault.object(forKey: "CustomBackColor") as! String
    }
}
