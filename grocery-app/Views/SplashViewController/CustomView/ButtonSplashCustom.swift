import UIKit

final class CustomSplashBtn: UIView {

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
            "CustomSplashBtn",
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
        btn.setTitle("Get Started", for: .normal)
    }
    
    private func configButton(titte: String = "", backgroundColor: UIColor, font: UIFont = .systemFont(ofSize: 13) ) {
//        btn.setTitle = titte
    }
    // MARK: - Action
    @IBAction private func btnDidTap(_ sender: UIButton) {
        buttonDidTap?()
    }
}
