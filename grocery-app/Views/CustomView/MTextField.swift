import UIKit

enum MTextFieldStyle {
    case normal
    case email
    case phone
    case password
    
    var leftImage: UIImage? {
        switch self {
        case .email: return UIImage(named: "email")
        case .phone: return UIImage(named: "phoneIcon")
        case .password: return UIImage(named: "Group 5")
        case .normal: return nil
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        case .phone: return .phonePad
        default: return .default
        }
    }
    
    var isSecure: Bool {
        self == .password
    }
    
    var showsRightButton: Bool {
        self == .password
    }
}

final class MTextField: UIView {
    
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var rightButton: UIButton!
    
    // MARK: - Public API
    
    var style: MTextFieldStyle = .normal {
        didSet {
            applyStyle()
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 6 {
        didSet {
            containerView.layer.cornerRadius = cornerRadius
        }
    }
    
    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    // MARK: - Private state
    private var isPasswordVisible = false
    
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
        setupBaseUI()
        applyStyle()
    }
    
    // MARK: - Setup
    private func loadNib() {
        let nibName = String(describing: Self.self)
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        
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
        overrideUserInterfaceStyle = .light
        backgroundColor = .clear
        
        containerView.backgroundColor = .clear
        contentView.layer.cornerRadius = cornerRadius
        containerView.clipsToBounds = true
        
        leftImageView.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
    }
    
    // MARK: - Style Logic
    private func applyStyle() {
        // Left image
        leftImageView.image = style.leftImage
        leftImageView.isHidden = style.leftImage == nil
        
        // Keyboard
        textField.keyboardType = style.keyboardType
        
        // Password
        textField.isSecureTextEntry = style.isSecure
        rightButton.isHidden = !style.showsRightButton
        
        if style != .password {
            isPasswordVisible = false
        }
        
        updateRightButtonIcon()
    }
    
    // MARK: - Actions
    @IBAction func didTapRightButton(_ sender: Any) {
         func didTapRightButton() {
            isPasswordVisible.toggle()
            textField.isSecureTextEntry = !isPasswordVisible
            updateRightButtonIcon()
        }
    }
    
    private func updateRightButtonIcon() {
        guard style == .password else { return }
        let imageName = isPasswordVisible ? "eye_open" : "eye_close"
        rightButton.setImage(UIImage(named: imageName), for: .normal)
    }
}
