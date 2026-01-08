//
//  SplashPage2ViewController.swift
//  grocery-app
//
//  Created by PRO on 1/8/26.
//

import UIKit

class SplashPage2ViewController: UIViewController {
    @IBOutlet weak var bgImageOne: UIImageView!
    @IBOutlet weak var stackViewContent: UIStackView!
    @IBOutlet weak var viewCustom: CustomLbSplash!
    @IBOutlet weak var bgImageTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupView()
    }
    
    func setupView(){
        bgImageOne.image = UIImage(named: "backgroundSplash2")
        bgImageTwo.image = UIImage(named: "bgSplashWhite2")
        viewCustom.backgroundColor = .clear
    }
}
