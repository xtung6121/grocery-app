//
//  ProductsCell.swift
//  grocery-app
//
//  Created by PRO on 2/18/26.
//

import UIKit

class ProductsCell: UICollectionViewCell {    @IBOutlet weak var productsImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var btnTicked: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cartCustonView: CartControlView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = .white
    }
}
