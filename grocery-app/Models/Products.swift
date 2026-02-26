//
//  Products.swift
//  grocery-app
//
//  Created by PRO on 2/24/26.
//

import Foundation

struct Products: Codable {
    let id: String
    let name: String
    let price: Double
    let currency: String
    let unit: String
    let imageUrl: String
    let isFavorite: Bool
    let discountLabel: String?
    let cartQuantity: Int
}
