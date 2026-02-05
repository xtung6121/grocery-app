import UIKit

final class LoadingManager {

    static let shared = LoadingManager()
    private init() {}

    private var indicator: UIActivityIndicatorView?

    func show() {
        guard let window = UIApplication.shared
            .connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
            .first else { return }

        if indicator == nil {
            let spinner = UIActivityIndicatorView(style: .large)
            spinner.color = .gray
            spinner.center = window.center
            spinner.startAnimating()

            window.addSubview(spinner)
            indicator = spinner
        }
    }

    func hide() {
        indicator?.stopAnimating()
        indicator?.removeFromSuperview()
        indicator = nil
    }
}
