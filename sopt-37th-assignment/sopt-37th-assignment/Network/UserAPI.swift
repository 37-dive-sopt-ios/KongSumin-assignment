//
//  UserAPI.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/21/25.
//

import Foundation

enum UserAPI {
    case register(RegisterRequest)           // POST /api/v1/users - 회원가입
    case login(LoginRequest)                 // POST /api/v1/auth/login - 로그인
    case userInfo(UserInfoRequest)
    case modifyInfo(ModifyInfoRequest)
}

extension UserAPI: TargetType {

    /// 기본 URL
    public var baseURL: String {
        return Environment.baseURL
    }

    /// API 경로
    public var path: String {
        switch self {
        case .register:
                    return "/api/v1/users"
        case .login:
            return "/api/v1/auth/login"
        case .userInfo(let request):
            return "/api/v1/users/\(request.id)"
        case .modifyInfo(let request):
            return "/api/v1/users/\(request.id)"
        }
    
    }

    /// The HTTP method used in the request.
    var method: HTTPMethod {
        switch self {
        case .register:
                    return .post
        case .login:
            return .post
        case .userInfo:
            return .get
        case .modifyInfo: return .patch
        }
    }

    /// The type of HTTP task to be performed.
    public var task: HTTPTask {
        switch self {
        case .register(let request):
                    // JSON 인코딩 가능한 객체를 바디로 전송
                    return .requestJSONEncodable(request)
        case .login(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestJSONEncodable(request)
        case .userInfo(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestPlain
        case .modifyInfo(let request): return .requestJSONEncodable(request)
        }
    }

    /// 헤더 (Moya와 동일 - 필요시 오버라이드)
    public var headers: [String: String]? {
        // Content-Type은 Task에서 자동 설정되므로 여기서는 nil 반환
        return nil
    }
}

// MARK: - Convenience Methods

extension UserAPI {
    /// 회원가입 API 요청 헬퍼
        public static func performRegister(
            username: String,
            password: String,
            name: String,
            email: String,
            age: Int,
            provider: NetworkProviding = NetworkProvider()
        ) async throws -> UserResponse {
            let request = RegisterRequest(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age
            )
            // BaseResponse로 감싸진 응답 디코딩
            let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.register(request))
            guard let data = response.data else {
                throw NetworkError.noData
            }
            
            return data
        }
    /// 로그인 API 요청 헬퍼
    static func performLogin(
        username: String,
        password: String,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> LoginResponse {
        let request = LoginRequest(username: username, password: password)
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<LoginResponse> = try await provider.request(UserAPI.login(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    /// 개인정보 조회  API 요청 헬퍼
    static func performUserInfo(
        id: Int,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let request = UserInfoRequest(id: id)
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.userInfo(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    /// 개인정보 수정  API 요청 헬퍼
    static func performModifyInfo(
        id: Int,
        name: String? = nil,
        email: String? = nil,
        age: Int? = nil,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let request = ModifyInfoRequest(id: id, name: name, email: email, age: age)
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.modifyInfo(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
}
