//
//  Font.swift
//  ziririt-iOS
//
//  Created by Porori on 7/12/24.
//

import UIKit

extension UIFont {
    
    enum PretendFontStyle: String {
        case black = "Black"
        case extraBold = "ExtraBold"
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"
        case extraLight = "ExtraLight"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case thin = "Thin"
    }
    
    enum GmarketFontStyle: String {
        case bold = "Bold"
        case light = "Light"
        case medium = "Medium"
    }
    
    static func gFont(style: GmarketFontStyle, size: CGFloat) -> UIFont? {
        return UIFont(name: "GmarketSansTTF\(style.rawValue)", size: size)
    }
        
    static func pFont(style: PretendFontStyle, size: CGFloat) -> UIFont? {
        return UIFont(name: "Pretendard-\(style.rawValue)", size: size)
    }
}
