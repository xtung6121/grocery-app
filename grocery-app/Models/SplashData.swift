//
//  SplashData.swift
//  grocery-app
//
//  Created by PRO on 1/18/26.
//

import Foundation

enum SplashDataResult {
    case success(splash: SplashAPI)
    case failure(error: NSError?)
}

struct SplashDataRespone: Decodable {
    let version: Int
    let canSkipAll: Bool
    let items: [SplashData]
}


struct SplashData: Codable, Hashable {
    let id: String
    let title: String
    let description: String
    let image: String
    let type: String
    let cta: String
    let order: Int
}
