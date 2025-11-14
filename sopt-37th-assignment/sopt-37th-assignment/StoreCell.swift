//
//  FoodMenuCell.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import UIKit
import SnapKit

final class StoreCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "StoreCollectionViewCell"
    
    // MARK: - UI Components
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fontmanager.body_r_14.font
        label.textColor = .baeminBlack
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(58)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    public func configure(store: StoreModel) {
        itemImageView.image = store.itemImg
        nameLabel.text = store.name
    }
}
