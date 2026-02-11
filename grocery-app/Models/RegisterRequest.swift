//
//  RegisterRequest.swift
//  grocery-app
//
//  Created by PRO on 2/9/26.
//

import Foundation

struct RegisterRequest: Encodable {
    let email: String
    let password: String
    let phone: String
}

