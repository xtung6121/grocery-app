import UIKit

struct IconTextButtonCustom {
    let text: String
    let textColor: UIColor
    let image: UIImage?
    let backgroundColor: UIColor
}

final class ButtonCustom: UIView {
    
    // MARK: - Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Callback
    var onTap: (() -> Void)?
    
    // MARK: - Init
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
        setupUI()
    }
    
    private func loadNib() {
        Bundle.main.loadNibNamed(
            String(describing: Self.self),
            owner: self,
            options: nil
        )
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.isUserInteractionEnabled = true
    }
    
    private func setupUI() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(didTap)
        )
        contentView.addGestureRecognizer(tap)
        layer.cornerRadius = 12
        clipsToBounds = true
        
        contentView.backgroundColor = .clear
        subView.backgroundColor = .clear
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    // MARK: - Config
    func configure(with model: IconTextButtonCustom) {
        label.text = model.text
        label.textColor = model.textColor
        iconImageView.image = model.image
        iconImageView.isHidden = model.image == nil
        contentView.backgroundColor = model.backgroundColor
    }
    
    @objc private func didTap() {
        print("DID TAP:", self)
        print("onTap:", onTap as Any)
        onTap?()
    }
    
}
