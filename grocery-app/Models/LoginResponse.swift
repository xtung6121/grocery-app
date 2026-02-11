//
//  LoginResponse.swift
//  grocery-app
//
//  Created by PRO on 2/12/26.
//

import Foundation

struct LoginResponse: Decodable {
    let message: String
    let token: String
    let user: UserResponse
}

struct UserResponse: Decodable {
    let id: Int
    let email: String
    let phone: String
}

