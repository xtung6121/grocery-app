import UIKit

final class ButtonSplashCustom: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var btn: UIButton!

    // MARK: - Callback
    var buttonDidTap: (() -> Void)?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        setupButton()
    }

    // MARK: - Load XIB
    private func loadNib() {
        Bundle.main.loadNibNamed(
            "ButtonSplashCustom",
            owner: self,
            options: nil
        )

        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    // MARK: - Setup UI
    private func setupButton() {
        btn.backgroundColor = ColorSet.primaryButton.color
        btn.setTitle("Get started", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
    }
    
    // MARK: - Action
    @IBAction private func btnDidTap(_ sender: UIButton) {
        buttonDidTap?()
    }
}
