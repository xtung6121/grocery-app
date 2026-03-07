import UIKit

class CartControlView: UIView {
    
    @IBOutlet private weak var labelAddToCart: UILabel!
    @IBOutlet private weak var imageViewCart: UIImageView!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    
    var onAddToCart: (() -> Void)?
    var onQuantityChanged: ((Int) -> Void)?
    
    private var currentQuantity: Int = 1 {
        didSet {
            quantityLabel.text = "\(currentQuantity)"
            onQuantityChanged?(currentQuantity)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: String(describing: Self.self), bundle: .main)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Không load được CartControlView.xib")
        }
        
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        // Debug nil outlet
        if labelAddToCart == nil { print("labelAddToCart nil") }
        if imageViewCart == nil { print("imageViewCart nil") }
        if plusButton == nil { print("plusButton nil") }
        if quantityLabel == nil { print("quantityLabel nil") }
        if minusButton == nil { print("minusButton nil") }
        
        labelAddToCart.text = "Add to cart"
        labelAddToCart.font = .title(size: 12)
        imageViewCart.image = UIImage(named: "cartIcon") ?? UIImage(systemName: "cart")
        quantityLabel.text = "\(currentQuantity)"
        quantityLabel.textAlignment = .center
    }
    
    private func setupActions() {
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        
        // Nếu muốn tap toàn view để add to cart
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
    }
    
    @objc private func minusTapped() {
        if currentQuantity > 1 {
            currentQuantity -= 1
        }
    }
    
    @objc private func plusTapped() {
        currentQuantity += 1
    }
    
    @objc private func viewTapped(_ gesture: UITapGestureRecognizer) {
        // Kiểm tra tap trên phần nào
        let location = gesture.location(in: self)
        if labelAddToCart.frame.contains(location) || imageViewCart.frame.contains(location) {
            onAddToCart?()
        }
    }
    
    func configure(quantity: Int = 1) {
        currentQuantity = max(1, quantity)
    }
}
