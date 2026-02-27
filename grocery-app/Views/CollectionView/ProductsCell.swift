//
//  ProductsCell.swift
//  grocery-app
//
//  Created by PRO on 2/18/26.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    @IBOutlet weak var productsImage: UIImageView!
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
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Buộc layout lại để tính height thật
        setNeedsLayout()
        layoutIfNeeded()
        
        // Tính size fit theo width của cell (horizontal required, vertical fitting)
        let targetSize = CGSize(width: layoutAttributes.size.width,
                                height: UIView.layoutFittingCompressedSize.height)
        
        let fittedSize = contentView.systemLayoutSizeFitting(targetSize,
                                                             withHorizontalFittingPriority: .required,
                                                             verticalFittingPriority: .fittingSizeLevel)
        
        let newAttributes = layoutAttributes
        newAttributes.frame.size.height = ceil(fittedSize.height)  // height thật, không 0 nữa
        
        return newAttributes
    }
    
    func configure(with item: Products) {
        titleLabel.text = item.name
        let imageName = item.isFavorite ? "heart.fill" : "heart"
        btnTicked.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
