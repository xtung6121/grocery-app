//
//  CustomLbSplash.swift
//  grocery-app
//
//  Created by PRO on 1/8/26.
//

import UIKit

class CustomLbSplash: UILabel {
    @IBOutlet weak var scLb: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var firstLb: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        setupLb()
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("CustomLbSplash", owner: self, options: nil)
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
    
    func setupLb() {
        firstLb.text = "hello"
        scLb.text = "lorem"
    }
    
}
