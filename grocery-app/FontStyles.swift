import UIKit

extension UIFont {

    // MARK: - Titles
    static func title(size: CGFloat = 17) -> UIFont {
        return UIFont(name: "Poppins-Bold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }

    // MARK: - Body
    static func body(size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }

    // MARK: - Thin
    static func thin(size: CGFloat = 15) -> UIFont {
        return UIFont(name: "Poppins-Thin", size: size)
        ?? UIFont.systemFont(ofSize: size, weight: .thin)
    }
}
