//
//  UserDTO.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/21/25.
//

/// 사용자 정보 응답 모델
struct UserResponse: Decodable {
    let id: Int
    let username: String
    let name: String
    let email: String
    let age: Int
    let status: String
}

/// 로그인 요청 모델
struct LoginRequest: Encodable {
    let username: String
    let password: String
}

/// 로그인 응답 모델
struct LoginResponse: Decodable {
    let userId: Int
    let message: String
}

/// 개인정보 수정 요청 모델
struct UpdateUserRequest: Encodable {
    let name: String?
    let email: String?
//    let age: Int?
}

/// 유저 등록 API
struct RegisterRequest: Encodable {
    let username: String
    let password: String
    let name: String
    let email: String
    let age: Int
}

/// 회원가입 응답 모델
struct RegisterResponse: Decodable {
    let username: String
    let password: String
    let name: String
    let email: String
    let age: Int
}

/// 개인정보 조회  API
struct UserInfoRequest: Encodable {
    let id: Int
}

/// 개인정보 수정  API
struct ModifyInfoRequest: Encodable {
    let id: Int
    let name: String?
    let email: String?
    let age: Int?
}

/// 탈퇴(비활성화)  API
struct InActiveUserRequest: Encodable {
    let id: Int
}
