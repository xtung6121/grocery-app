
import UIKit


//   type: "not_skippable", ->
//   skipable ->


class SplashDeliveryViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var lbSplash: CustomLbSplash!
    @IBOutlet weak var skipBtn: UIButton!
    private var splashData: [SplashData] = []
    private var currentIndex: Int = 0
    
    init(splashData: [SplashData]) {
        super.init(nibName: "SplashDeliveryViewController", bundle: .main)
        self.splashData = splashData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPageDelivery()
    }
    
    private func setupView() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        
        skipBtn.setTitle("Skip", for: .normal)
        skipBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .thin)
        skipBtn.setTitleColor(.darkGray, for: .normal)
        
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .thin)
        nextBtn.setTitleColor(ColorSet.primaryButton.color, for: .normal)
    }
    
    private func setupPageDelivery() {
        guard splashData.indices.contains(currentIndex) else { return }
        
        let items = splashData[currentIndex]
        imageView.image = UIImage(named: items.image)
        lbSplash.config(
            title: items.title,
            subTitle: items.description,
            numberOfLines: 2,
            image: nil)
        
        pageControl.currentPage = currentIndex
        pageControl.numberOfPages = splashData.count
        
        skipBtn.isHidden = !canSkipCurrentPage()
        let nextTitle = isLastPage() ? "Start" : "Next"
        nextBtn.setTitle(nextTitle, for: .normal)
    }
    
    private func currentItem() -> SplashData? {
        splashData.indices.contains(currentIndex) ? splashData[currentIndex] : nil
    }
    
    private func isLastPage() -> Bool {
        currentIndex == splashData.count - 1
    }
    
    private func canSkipCurrentPage() -> Bool {
        guard let item = currentItem() else { return false }
        return item.type == .skippable
    }
    
    
    @IBAction func skipBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        if isLastPage() {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        } else {
            currentIndex += 1
            setupPageDelivery()
        }
    }
}
