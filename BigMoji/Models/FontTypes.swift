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
    
    var design: Font {
        switch self {
        case .monospaced:
            return .system(size: 400,design: .monospaced)
        case .rounded:
            return .system(size: 400,design:.rounded)
        case .serif:
            return .system(size: 400,design:.serif)
        }
    }
}

enum FontCustomFamilys:String,CaseIterable,Identifiable{
    var id:String { self.rawValue }
    
    case AcademyEngravedLetPlain = "白抜き"
    case GillSans_UltraBold = "極太(bold)"
    case SnellRoundhand_Black = "崩し文字"
    
    var design: Font {
        switch self {
        case .AcademyEngravedLetPlain :
            return .custom("AcademyEngravedLetPlain", size: 400)
        case .GillSans_UltraBold:
            return .custom("GillSans-UltraBold", size: 400)
        case .SnellRoundhand_Black :
            return .custom("SnellRoundhand-Black", size: 400)
        }
    }
}
