//
//  Fontmanager.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 10/28/25.
//


import UIKit


public extension UIFont{
    enum FontType{
        case regular
        case semibold
        case bold
        
        var name: String{
            switch self {
            case .regular:
                return "Pretendard-Regular"
            case .semibold:
                return "Pretendard-SemiBold"
            case .bold:
                return "Pretendard-Bold"
            }
        }
    }
}


public struct FontProperty{
    let font: UIFont.FontType
    let size: CGFloat
    let lineHeight: CGFloat
    let kern: CGFloat
}

public enum Fontmanager{
    case head_b_24
    case head_b_18
    case title_sb_18
    case body_r_14
    case caption_r_10
    case body_r_10
    
    public var fontProperty: FontProperty{
        switch self {
        case .head_b_24:
            return FontProperty(font: .bold, size: 24, lineHeight: 100, kern: -2)
        case .head_b_18:
            return FontProperty(font: .bold, size: 18, lineHeight: 100, kern: -2)
        case .title_sb_18:
            return FontProperty(font: .semibold, size: 18, lineHeight: 100, kern: -3)
        case .body_r_14:
            return FontProperty(font: .regular, size: 14, lineHeight: 100, kern: -4)
        case .caption_r_10:
            return FontProperty(font: .regular, size: 10, lineHeight: 100, kern: -4)
        case .body_r_10:
            return FontProperty(font: .regular, size: 10, lineHeight: 100, kern: -4)
        }
    }
}

public extension Fontmanager{
    var font: UIFont{
        guard let font = UIFont(name: fontProperty.font.name, size: fontProperty.size)
        else {
            return UIFont()
        }
        return font
    }
    
}
