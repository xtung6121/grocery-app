//
//  SplashPage3ViewController.swift
//  grocery-app
//
//  Created by PRO on 1/8/26.
//

import UIKit

class SplashPage3ViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipBtn: UIButton!
    
    override func viewDidLoad() {
        overrideUserInterfaceStyle = .light
        setupView()
    }
    
    func setupView() {
        
    }
}
