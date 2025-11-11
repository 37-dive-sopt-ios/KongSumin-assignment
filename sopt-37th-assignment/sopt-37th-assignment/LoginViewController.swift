//
//  LoginViewController.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 10/28/25.


import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    //MARK: - UI Components
    lazy var idTextField: UITextField = {
        let textField = PaddedTextField()//padding10인 텍스트필드로 생성
        textField.placeholder = "이메일 아이디"
        textField.font = Fontmanager.body_r_14.font
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        return textField
    }()
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eye-slash2"), for: .normal)
        button.addTarget(self, action: #selector(didTapEyeButton), for: .touchUpInside)
        button.tintColor = .baeminGray200
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "x-circle2"), for: .normal)
        button.tintColor = .baeminGray200
        button.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        return button
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = PaddedTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.font = Fontmanager.body_r_14.font
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(named: "eye-slash2"), for: .normal)
        eyeButton.addTarget(self, action: #selector(didTapEyeButton), for: .touchUpInside)
        eyeButton.tintColor = .baeminGray200
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setImage(UIImage(named: "x-circle2"), for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        deleteButton.tintColor = .baeminGray200
        
        let rightViewContainer = UIView()
        rightViewContainer.addSubview(deleteButton)
        rightViewContainer.addSubview(eyeButton)
        
        rightViewContainer.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(24)
        }
        eyeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        deleteButton.snp.makeConstraints {
            $0.trailing.equalTo(eyeButton.snp.leading).offset(-6)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        textField.rightView = rightViewContainer
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navItem = UINavigationItem(title : "이메일 또는 아이디로 계속")
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        navItem.leftBarButtonItem = backButton
        navigationBar.setItems([navItem], animated: false)
        return navigationBar
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = Fontmanager.head_b_18.font
        button.setTitleColor(.baeminWhite, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .baeminGray200
        return button
    }()

    lazy var textButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "계정 찾기"
        config.image = UIImage(systemName: "chevron.right")
        config.imagePlacement = .trailing
        config.imagePadding = 4
        config.baseForegroundColor = .baeminBlack
        let button = UIButton(configuration: config)
        button.titleLabel?.font = Fontmanager.body_r_14.font
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    // MARK: - Actions
    @objc
    private func didTapEyeButton(){
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye-slash2" : "eye2"
        eyeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc
    private func didTapDeleteButton(){
        idTextField.text = ""
        passwordTextField.text = ""
        updateLoginButtonState()
    }
    @objc private func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc
    private func loginButtonDidtap(){
        pushToWelcomeVC()
    }
    
    @objc
    private func textFieldDidChange() {
        updateLoginButtonState()
    }
    
    func updateLoginButtonState(){
        let isFormFilled = !(idTextField.text?.isEmpty ?? true) && !( passwordTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = isFormFilled
        loginButton.backgroundColor = isFormFilled ? .baeminMint500 : .baeminGray200
        
    }
    
    @objc
    private func togglePasswordVisibility(){
        passwordTextField.isSecureTextEntry.toggle()
        if let button = passwordTextField.rightView as? UIButton {
            let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }

    private func pushToWelcomeVC(){
        let vc = WelcomeViewController()
        vc.delegate = self
        vc.userId = idTextField.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setAddTarget(){
        loginButton.addTarget(self, action: #selector(loginButtonDidtap), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setUI(){
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        [navigationBar, idTextField, passwordTextField, loginButton, textButton].forEach {
            self.view.addSubview($0)
        }
        
        navigationBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(46)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(46)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(46)
        }
        textButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(14)
        }
    }
}
extension LoginViewController: LoginViewControllerDelegate {
    func resetLoginFields() {
        idTextField.text = ""
        passwordTextField.text = ""
        updateLoginButtonState()
    }
}

#Preview {
    LoginViewController()
}
