//
//  Color.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/31/24.
//

import UIKit

extension UIColor {
    
    // 테마 컬러 (찌리릿 테마 컬러 / 연두색)
    static let greenThemeColor = UIColor(hex: "00FFA3")
    
    // 기본적인 검정 배경 컬러
    static let blackBackgroundColor = UIColor(hex: "141517")
    
    // 회색 폰트 컬러
    static let grayFontColor = UIColor(hex: "ADADAD")
    
    // 콘텐츠 회색 배경 컬러
    static let grayContentBackgroundColor = UIColor(hex: "303032")
    
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

