import UIKit

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.8
    }
    
    // Optional: hàm config data
    func configure(with category: CategoryModel) {  
        nameLabel.text = category.name
        imageView.image = UIImage(named: category.iconName)
    }
}

struct CategoryModel {
    let name: String
    let iconName: String  // fake data
}
    
