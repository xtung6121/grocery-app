//
//  ColorSet.swift
//  grocery-app
//
//  Created by PRO on 1/6/26.
//

import UIKit
import Foundation

enum ColorSet: String {
    case backgroundColor
    case primaryColor
    case primaryDarkColor
    case primaryButton
    
    var color: UIColor {
        guard let color = UIColor(named: self.rawValue) else {
            fatalError("invalid color set")
        }
        
        return color
    }
}
