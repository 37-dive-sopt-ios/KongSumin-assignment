//
//  WelcomeViewController.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 10/29/25.
//

import Foundation
import UIKit
import SnapKit

//MARK: - Protocol
protocol LoginViewControllerDelegate: AnyObject {
    func resetLoginFields()
}

//MARK: - WelcomeViewController
class WelcomeViewController: UIViewController {
    var userId: String?
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - UI Component
    lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navItem = UINavigationItem(title : "대체 뼈찜 누가 시켰어??")
        navigationBar.setItems([navItem], animated: false)
        return navigationBar
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image21"))
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("메인으로 가기", for: .normal)
        button.titleLabel?.font = Fontmanager.head_b_18.font
        button.setTitleColor(.baeminWhite, for: .normal)
        button.backgroundColor = .baeminMint500
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var welcomeLable: UILabel = {
        let welcomeLable = UILabel()
        welcomeLable.text = "환영합니다"
        welcomeLable.font = Fontmanager.head_b_24.font
        welcomeLable.textColor = .baeminBlack
        welcomeLable.textAlignment = .center
        return welcomeLable
    }()
    
    lazy var hiLable: UILabel = {
        let hiLable = UILabel()
        hiLable.text = "??님 반가워요!"
        hiLable.font = Fontmanager.title_sb_18.font
        hiLable.textColor = .baeminBlack
        hiLable.textAlignment = .center
        return hiLable
    }()
    
    // MARK: - METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        bindID()
    }
    @objc
    private func backButtonDidTap() {
        delegate?.resetLoginFields()
        let rootVC = RootViewController()
        navigationController?.setViewControllers([rootVC], animated: true)
    }
    
    private func setUI(){
        self.view.backgroundColor = .white
    }
    private func setLayout() {
        [navigationBar, imageView, welcomeLable,hiLable,backButton].forEach {
            self.view.addSubview($0)
        }
        
        navigationBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(6)
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(211)
        }
        welcomeLable.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
        }
        hiLable.snp.makeConstraints {
            $0.top.equalTo(welcomeLable.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(18)
        }
        backButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-48)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(52)
        }
    }
    
    private func bindID(){
        guard let id = userId else {return}
        self.hiLable.text = "\(id)님 반가워요!"
    }
}


#Preview {
    WelcomeViewController()
}
