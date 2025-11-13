//
//  TabCell.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import Then
import UIKit
import SnapKit

class TabCell: UICollectionViewCell {
    let titleLabel = UILabel().then {
        $0.font = Fontmanager.head_b_18.font
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
