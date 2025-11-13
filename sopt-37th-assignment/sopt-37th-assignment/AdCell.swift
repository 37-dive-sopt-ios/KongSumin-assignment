//
//  AdCell.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import Then
import UIKit
import SnapKit

class AdCell: UICollectionViewCell {
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    //MARK: - Layout
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    //MARK: - Configure
    func configure(image: UIImage) {
        imageView.image = image
    }
}
