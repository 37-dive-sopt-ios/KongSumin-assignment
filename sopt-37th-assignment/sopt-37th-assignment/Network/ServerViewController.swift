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
            view.addSubview(titleLabel)
            view.addSubview(loginButton)
        }
        
        func setLayout() {
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
                $0.horizontalEdges.equalToSuperview().inset(20)
            }
            
            loginButton.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(12)
                $0.horizontalEdges.equalToSuperview().inset(20)
                $0.height.equalTo(55)
            }
        }
        
        // MARK: - Actions
        @objc private func loginButtonTapped() {
                let username = "sumin"
                let password = "1234"
            
            // Swift Concurrency를 사용한 네트워크 요청!
            Task {
                await performLogin(username: username, password: password)
            }
        }
        
        // MARK: - Network Methods (Swift Concurrency!)
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
                
                // 성공 시 알럿
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
    }

    #Preview {
        ServerViewController()
    }

    
    
    
    
//    // MARK: - UI
//    private let titleLabel = UILabel().then {
//        $0.text = ""
//        $0.font = Fontmanager..font
//        $0.textColor = .baeminBlack
//    }
//
//    private let tableView = UITableView().then {
//        $0.separatorStyle = .singleLine
//        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//    }
//
//    // 데이터 예시
//    private let servers = [
//        "🍏 메인 서버",
//        "🍎 백업 서버",
//        "🥑 테스트 서버",
//        "🍒 개발 서버",
//        "🍌 베타 서버"
//    ]
//
//    // MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        setupLayout()
//        setupTableView()
//    }
//
//    // MARK: - Layout
//    private func setupLayout() {
//        view.addSubview(titleLabel)
//        view.addSubview(tableView)
//
//        titleLabel.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(20)
//            $0.leading.equalToSuperview().offset(16)
//        }
//
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//
//    // MARK: - TableView
//    private func setupTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//}
//
//// MARK: - TableView Delegate & DataSource
//extension ServerViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return servers.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        var config = cell.defaultContentConfiguration()
//        config.text = servers[indexPath.row]
//        config.textProperties.font = Fontmanager.body_r_16.font
//        cell.contentConfiguration = config
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("선택된 서버:", servers[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
