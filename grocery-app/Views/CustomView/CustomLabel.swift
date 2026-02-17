
import UIKit

final class CustomLabel: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var firstLb: UILabel!
    @IBOutlet weak var scLb: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        loadNib()
        setupBaseUI()
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
    
    private func setupBaseUI() {
        contentView.backgroundColor = .clear
        firstLb.font = .title(size: 25)
        firstLb.textColor = .black
        firstLb.numberOfLines = 1
        
        scLb.font = .systemFont(ofSize: 15, weight: .light)
        scLb.textColor = .gray
        scLb.numberOfLines = 2
        scLb.lineBreakMode = .byTruncatingTail

    }
    
    func applyConfiguration(title: String, subTitle: String, titleNumberOfLines: Int, subTitleNumberOfLines: Int) {
            firstLb.text = title
            scLb.text = subTitle
            scLb.isHidden = subTitle.isEmpty
            firstLb.numberOfLines = titleNumberOfLines
            scLb.numberOfLines = subTitleNumberOfLines
    }
}
