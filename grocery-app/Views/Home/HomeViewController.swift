//
//  HomeViewController.swift
//  grocery-app
//
//  Created by PRO on 1/15/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        view.largeContentTitle = "Home"

    }
}
