


import UIKit

class SplashPageViewController: UIViewController {
    @IBOutlet weak var scLb: UILabel!
    @IBOutlet weak var firstLb: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var btnStart: MButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var stackviewHeader: UIStackView!
    @IBOutlet weak var stackviewFooter: UIStackView!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupView()
    }
    
    func setupView() {
        viewHeader.backgroundColor = .clear
        viewFooter.backgroundColor = .clear
        backgroundImage.image = UIImage(named: "imageTitle")
        stackviewHeader.backgroundColor = .clear
        stackviewFooter.backgroundColor = .clear
        btnStart.buttonDidTap = {
            [weak self] in
            guard let self = self else { return }
            self.currentPage += 1
        }
    }
}
