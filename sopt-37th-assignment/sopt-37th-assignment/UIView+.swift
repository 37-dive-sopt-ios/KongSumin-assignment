//
//  UIView+.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/21/25.
//

import UIKit

extension UIView {//UIView 전체에서 쓸 수 있게 UIView 로 설정한다.
    /// UIView 여러 개 인자로 받아서 한 번에 addSubview 합니다.
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }

}
