//
//  TabBar.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import UIKit
import SwiftUI
import Then
import SnapKit

protocol CustomTabBarDelegate: AnyObject {
    func didSelectTab(index: Int)
}

class RootTabBar: UIView {
    // MARK: - Properties
    private let tabItems: [(title: String, icon: UIImage?)] = [
        ("홈", UIImage(named: "home")),
        ("서버", UIImage(named: "shopping")),
        ("찜", UIImage(named: "like")),
        ("주문내역", UIImage(named: "order")),
        ("마이배민", UIImage(named: "mypage")),
    ]
    private var buttons: [UIButton] = []
    weak var delegate: CustomTabBarDelegate?
    private var selectedIndex: Int = 0
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    // MARK: - UI
    private func setupUI() {
        backgroundColor = .white
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        for (index, item) in tabItems.enumerated() {
            let button = UIButton(type: .system)
            button.tag = index
            
            var config = UIButton.Configuration.plain()
            config.title = item.title
            config.image = item.icon
            config.imagePlacement = .top
            config.imagePadding = 4
            config.baseForegroundColor = .baeminGray700
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fontmanager.body_r_10.font
                return outgoing
            }
            
            button.configuration = config
            button.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)

            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
            
        }
        selectTab(index: 0)
    }
    
    // MARK: - Actions
    @objc private func tabTapped(_ sender: UIButton) {
        selectTab(index: sender.tag)
        delegate?.didSelectTab(index: sender.tag)
    }
    
    func selectTab(index: Int) {
        guard index >= 0 && index < buttons.count else { return }
        selectedIndex = index
        for (i, button) in buttons.enumerated() {
            button.isSelected = (i == index)
        }
    }
}

#Preview {
    let tabBar = RootTabBar()
    tabBar.frame = CGRect(x: 0, y: 0, width: 393, height: 82)
    tabBar.backgroundColor = .lightGray
    return tabBar
}
