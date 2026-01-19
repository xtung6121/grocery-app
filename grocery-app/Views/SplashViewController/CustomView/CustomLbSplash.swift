import UIKit

enum SplashWithImageLayout {
    case imageTop
    case imageBottom
}

final class CustomLbSplash: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet private weak var firstLb: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet private weak var scLb: UILabel!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Setup
    private func commonInit() {
        loadNib()
        setupUI()
    }
    
    private func loadNib() {
        Bundle.main.loadNibNamed(
            String(describing: Self.self),
            owner: self,
            options: nil
        )
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
//    private func initialView() {
//        let nibName: String
//        switch layoutType {
//        case .imageBottom: return "LayoutWithImageTop"
//        case .imageTop: return "LayoutImageBottom"
//        default:
//            <#code#>
//        }
//        
//    }

    private func setupUI() {
        firstLb.font = .systemFont(ofSize: 32, weight: .bold)
        firstLb.textColor = .black
        firstLb.textAlignment = .center
        firstLb.numberOfLines = 2
        
        scLb.font = .systemFont(ofSize: 16, weight: .medium)
        scLb.textColor = .gray
        scLb.textAlignment = .center
        scLb.numberOfLines = 2
        
//        imageView.image = UIImage(named: image)
        // output la gi ??
        
    }
    
    func config(title: String, subTitle: String, numberOfLines: Int, image: UIImage? ) {
        firstLb.text = title
        scLb.text = subTitle
        scLb.isHidden = subTitle.isEmpty
        firstLb.numberOfLines = numberOfLines
        scLb.numberOfLines = numberOfLines
        
        imageView.image = image
    
    }
    
}
