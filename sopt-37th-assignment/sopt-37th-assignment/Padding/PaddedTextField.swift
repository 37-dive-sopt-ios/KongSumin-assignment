//
//  PaddedTextField.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/11/25.
//

import Foundation
import UIKit
import SnapKit

class PaddedTextField: UITextField {//padding있는 텍스트필드 형식
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var insetBounds = bounds.inset(by: padding)
        if rightView != nil {
            insetBounds.size.width -= 30
        }
        return insetBounds
    }
}
