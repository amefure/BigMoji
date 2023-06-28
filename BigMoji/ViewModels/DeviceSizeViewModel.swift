//
//  DeviceSizeViewModel.swift
//  BigMoji
//
//  Created by t&a on 2023/06/28.
//

import UIKit

class DeviceSizeViewModel {
    
    public let deviceWidth = UIScreen.main.bounds.width
    public let deviceHeight = UIScreen.main.bounds.height
    // 端末設定のカレンダー
    public let calendar = Calendar.current
    
    public var isSESize:Bool {
        if deviceWidth < 376{
            return true
        }else{
            return false
        }
    }
    
    public var isiPadSize:Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }else{
            return false
        }
    }
    
    public var isLandscape:Bool {
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            return true
        }else{
            return false
        }
    }
    
}
