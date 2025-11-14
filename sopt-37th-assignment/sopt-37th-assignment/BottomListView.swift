//
//  BottomListView.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import Foundation
import UIKit
import Then
import SnapKit

class BottomListView: UIView {
    private let listView = UIView()
    
    // MARK: - Properties
    private lazy var foodMenuView = FoodMenuController()
    private lazy var locationLankingLabel = UILabel().then{
        $0.text = "우리 동네 한그릇 인기 랭킹"
        $0.textColor = .baeminWhite
        $0.font = Fontmanager.head_b_18.font
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
    
    // MARK: - Layout
    private func setupUI() {
        addSubview(locationLankingLabel)
        locationLankingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(18)
        }
    }
}

#Preview {
    let bottomListView = BottomListView()
    bottomListView.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
    bottomListView.backgroundColor = .systemMint
    return bottomListView
}
