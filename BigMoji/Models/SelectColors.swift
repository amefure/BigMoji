//
//  TextColors.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

enum SelectColors :String,CaseIterable,Identifiable{
    var id:String { self.rawValue }
    
    case red
    case blue
    case green
    case yellow
    case orange
    case purple
    case gray
    case black
    case white
    
    var color: Color {
        switch self {
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        case .orange:
            return Color.orange
        case .purple:
            return Color.purple
        case .gray:
            return Color.gray
        case .black:
            return Color.black
        case .white:
            return Color.white
        }
    }
}
