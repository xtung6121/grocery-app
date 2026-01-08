//
//  CustomStartView.swift
//  grocery-app
//
//  Created by PRO on 1/6/26.
//

import UIKit

class MButton : UIButton {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btn: UIButton!
    
    
    // callback
    // closue
    // delegated
    var buttonDidTap: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        setupButton()
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("MButton", owner: self, options: nil)
        overrideUserInterfaceStyle = .light
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupButton() {
        btn.backgroundColor = ColorSet.primaryButton.color
        btn.setTitle("Get Started", for: .normal)
    }
    
    
    @IBAction func btnDidTap(_ sender: Any) {
        buttonDidTap?()
    }
}
