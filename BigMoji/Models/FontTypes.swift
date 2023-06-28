//
//  FontTypes.swift
//  BigMoji
//
//  Created by t&a on 2023/06/28.
//

import SwiftUI

enum FontWeights:String,CaseIterable,Identifiable{
    var id:String { self.rawValue }
    
    case light
    case bold
    
    var weight: Font.Weight {
        switch self {
        case .light:
            return .light
        case .bold:
            return .bold
        }
    }
}


enum FontFamilys:String,CaseIterable,Identifiable{
    var id:String { self.rawValue }
    
    case monospaced = "スペース"
    case rounded = "ゴシック体"
    case serif = "明朝体"
    
    var design: Font.Design {
        switch self {
        case .monospaced:
            return .monospaced
        case .rounded:
            return .rounded
        case .serif:
            return .serif
        }
    }
}
