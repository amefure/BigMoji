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
    
    public var weight: Font.Weight {
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
    
    case monospaced
    case rounded
    case serif
    
    public var rawValue: String {
        switch self {
        case .monospaced:
            return L10n.monospaced
        case .rounded:
            return L10n.rounded
        case .serif:
            return L10n.serif
        }
    }
    
    public var design: Font {
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
    
    case AcademyEngravedLetPlain
    case GillSans_UltraBold
    case SnellRoundhand_Black
    
    public var rawValue: String {
        switch self {
        case .AcademyEngravedLetPlain :
            return L10n.academyEngravedLetPlain
        case .GillSans_UltraBold:
            return L10n.gillsansUltrabold
        case .SnellRoundhand_Black :
            return L10n.snellRoundhandBlack
        }
    }
    
    public var design: Font {
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
