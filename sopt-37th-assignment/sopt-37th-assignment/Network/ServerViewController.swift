//
//  ServerViewController.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/20/25.
//

import UIKit


import SnapKit
import Then

class ServerViewController: BaseViewController {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "API 보내볼꺼임"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "회원 ID 입력 (예: 1)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.addPadding()
        return textField
    }()

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username (예: KSM)"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.text = "sm"
        textField.addPadding()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password (예: P@ssw0rd!)"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.text = "Aa1234!@"
        textField.addPadding()
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름 (예: 홍길동)"
        textField.borderStyle = .roundedRect
        textField.text = "Kong"
        textField.addPadding()
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email (예: hong@example.com)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.text = "test@naver.com"
        textField.addPadding()
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이 (예: 25)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.text = "25"
        textField.addPadding()
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입 (POST /api/v1/users)", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인 (POST /api/v1/auth/login)", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var userInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("개인정보 조회 (GET /api/v1/users/{id})", for: .normal)
        button.backgroundColor = UIColor(named: "baemin_mint_500")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var modifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("개인정보 수정 (PATCH /api/v1/users/{id})", for: .normal)
        button.backgroundColor = UIColor.systemOrange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    
    // MARK: - Properties
    
    private let provider: NetworkProviding
    
    // MARK: - Init
    
    init(provider: NetworkProviding = NetworkProvider()) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setHierarchy() {
        view.addSubviews(
            titleLabel,
            usernameTextField,
            passwordTextField,
            nameTextField,
            emailTextField,
            ageTextField,
            registerButton,
            loginButton,
            idTextField,
            userInfoButton,
            modifyButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        userInfoButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        modifyButton.snp.makeConstraints {
                $0.top.equalTo(userInfoButton.snp.bottom).offset(12)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(55)
            }
    }
    
    // MARK: - Actions
    
    @objc private func registerButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText) else {
            showAlert(title: "입력 오류", message: "모든 필드를 올바르게 입력해주세요.")
            return
        }
        
        // Swift Concurrency를 사용한 네트워크 요청!
        Task {
            await performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age
            )
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "입력 오류", message: "아이디와 비밀번호를 입력해주세요.")
            return
        }
        
        // Swift Concurrency를 사용한 네트워크 요청!
        Task {
            await performLogin(username: username, password: password)
        }
    }
    
    
    @objc private func userInfoButtonTapped() {
        guard let idText = idTextField.text,
                  let id = Int(idText)
        else {
            showAlert(title: "입력 오류", message: "아이디를 입력해주세요.")
            return
        }
        
        // Swift Concurrency를 사용한 네트워크 요청!
        Task {
            await performUserInfo(id: id)
        }
    }
    
    @objc private func modifyButtonTapped() {
        guard let idText = idTextField.text,
                  let id = Int(idText)
        else {
            showAlert(title: "입력 오류", message: "아이디를 입력해주세요.")
            return
        }
        let name = nameTextField.text?.isEmpty == true ? nil : nameTextField.text
        let email = emailTextField.text?.isEmpty == true ? nil : emailTextField.text
        let age = ageTextField.text.flatMap { Int($0) }
        Task {
            do {
                let response = try await UserAPI.performModifyInfo(id: id, name: name, email: email, age: age)
                showAlert(title: "수정 완료", message: "이름: \(response.name), 이메일: \(response.email), 나이: \(response.age)")
            } catch {
                showAlert(title: "수정 실패", message: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Network Methods (Swift Concurrency!)
    
    /// 회원가입 API 호출
    @MainActor
    private func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int
    ) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age,
                provider: provider
            )
            
            // 성공 시 Welcome 화면으로 이동
            showAlert(title: "회원가입 성공", message: "회원가입이 완료되었습니다!")
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Register Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    /// 로그인 API 호출
    @MainActor
    private func performLogin(username: String, password: String) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performLogin(
                username: username,
                password: password,
                provider: provider
            )
            
            // 성공 시 Welcome 화면으로 이동
            showAlert(title: "로그인 성공", message: response.message)
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Login Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Login Unknown Error] \(error)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    
    /// 개인정보 조회  API 호출
    @MainActor
    private func performUserInfo(id: Int) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performUserInfo(
                id: id,
                provider: provider
            )
            showAlert(title: "개인정보 조회 성공", message: "안녕하세요 \(response.username)님")
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Login Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "개인정보 조회 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Login Unknown Error] \(error)")
            showAlert(title: "개인정보 조회 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    
}






#Preview {
    ServerViewController()
}
