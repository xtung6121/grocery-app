//
//  APIServiceProtocol.swift
//  grocery-app
//
//  Created by PRO on 1/19/26.
//

import Foundation

protocol UserServiceProtocol {
    func getSplash(title: String, subTitle: String, image: String, completion: @escaping (_ result: SplashData?, _ error: NSError?) -> Void)
}

