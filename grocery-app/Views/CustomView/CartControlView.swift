import UIKit

class CartControlView: UIView {
    
    @IBOutlet private weak var labelAddToCart: UILabel!
    @IBOutlet private weak var imageViewCart: UIImageView!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    
    var onAddToCart: (() -> Void)?          // Khi tap "Add to cart"
    var onQuantityChanged: ((Int) -> Void)? // Khi thay đổi số lượng (+/-)
    
    // MARK: - Properties
    private var currentQuantity: Int = 1 {
        didSet {
            quantityLabel.text = "\(currentQuantity)"
            onQuantityChanged?(currentQuantity)
        }
    }
    
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
        // Load nib và add vào self
        let nib = UINib(nibName: String(describing: Self.self), bundle: .main)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Không load được CartControlView.xib")
        }
        
        // Add view từ nib vào self
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Setup UI ban đầu
        setupUI()
    }
    
    private func setupUI() {  
        labelAddToCart.text = "Add to cart"
        imageViewCart.image = UIImage(named: "cartIcon")
        quantityLabel.text = "\(currentQuantity)"

    }
    
    // MARK: - Actions
    @objc private func minusTapped() {
        if currentQuantity > 1 {
            currentQuantity -= 1
        }
    }
    
    @objc private func plusTapped() {
        currentQuantity += 1
    }
    
    @objc private func viewTapped() {
        // Nếu anh muốn tap toàn bộ view để add to cart
        onAddToCart?()
    }
    
    // MARK: - Public methods để config từ cell
    func configure(quantity: Int = 1) {
        currentQuantity = max(1, quantity)
    }
    
    func setQuantity(_ quantity: Int) {
        currentQuantity = max(1, quantity)
    }
}
