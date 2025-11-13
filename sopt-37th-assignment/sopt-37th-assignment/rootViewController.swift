//  rootViewController.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/12/25.
//

import Foundation
import UIKit
import Then
import SnapKit

//MARK: - rootViewController
class rootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - UI Component
    private lazy var stickyHeader = UIView()
    private lazy var locationButton = UIButton().then {
        $0.setTitle("우리집", for: .normal)
        $0.setImage(.polygon, for: .normal)
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        $0.titleLabel?.font = Fontmanager.head_b_18.font
    }
    private lazy var cartButton = UIButton().then {
        $0.setImage(.cart, for: .normal)
    }
    private lazy var notificationButton = UIButton().then {
        $0.setImage(.bell, for: .normal)
    }
    private lazy var dividerButton = UIButton().then {
        $0.setImage(.division, for: .normal)
    }
    
    private lazy var searchField = UITextField().then {
        $0.font = Fontmanager.body_r_14.font
        $0.textColor = .baeminGray300
        $0.tintColor = .baeminGray300
        $0.placeholder = "찾아라! 맛있는 음식과 맛집"
        $0.textAlignment = .left
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminBlack.cgColor
        $0.clipsToBounds = true
        
        
        let iconImageView = UIImageView(image: .searchIcon)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .baeminGray300
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 20))
        iconImageView.frame = CGRect(x: 4, y: 0, width: 20, height: 20)
        iconContainer.addSubview(iconImageView)
        $0.rightView = iconContainer
        $0.rightViewMode = .always
    }

    private lazy var bmartImageView = UIImageView().then{
        $0.image = .eventBtn
    }
    private lazy var eventTextButton = UIButton().then{
        $0.setTitle("전상품 쿠폰팩 + 60%특가", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .baeminBlack
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.titleLabel?.font = Fontmanager.head_b_18.font
    }
    
    
    //MARK: - UI
    private func setUI(){
        self.view.backgroundColor = .white
    }
    
    private func setLayout(){
        setTopUIs()
    }
    
    private func setTopUIs() {
        view.addSubview(stickyHeader)
        stickyHeader.addSubview(locationButton)
        stickyHeader.addSubview(cartButton)
        stickyHeader.addSubview(notificationButton)
        stickyHeader.addSubview(dividerButton)
        stickyHeader.addSubview(searchField)
        stickyHeader.addSubview(bmartImageView)
        stickyHeader.addSubview(eventTextButton)
        stickyHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(74)
        }
        locationButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        cartButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        notificationButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(cartButton.snp.leading).offset(-12)
            $0.size.equalTo(24)
        }
        dividerButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-12)
            $0.size.equalTo(24)
        }
        searchField.snp.makeConstraints{
            $0.centerY.equalTo(stickyHeader.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            
        }
        bmartImageView.snp.makeConstraints{
            $0.centerY.equalTo(searchField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(16)
            $0.width.equalTo(50)
        }
        eventTextButton.snp.makeConstraints{
            $0.centerY.equalTo(bmartImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            
        }
        
        
    }
    
    
    
    
//    private func bind(){
//        
//    }
    
    //MARK: - function
}


#Preview {
    rootViewController()
}
