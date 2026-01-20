
import UIKit


//   type: "not_skippable", ->
//   skipable ->

enum DeliverySplashScreen: CaseIterable {
    case buy
    case fast
    case quality
    
    var title: String {
        switch self {
        case .buy:
            return "Buy Grocery"
        case .fast:
            return "Fast Delivery"
        case .quality:
            return "Enjoy Quality Food"
        }
    }
    
    var subTitle: String {
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    }
    
    var imageName: String {
        switch self {
        case .buy:
            return "DeliveryCuate"
        case .fast:
            return "onlineGroceries"
        case .quality:
            return "Passionate"
        }
    }
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}

class SplashDeliveryViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var lbSplash: CustomLbSplash!
    @IBOutlet weak var skipBtn: UIButton!
    private var splashData: [SplashData] = []
    
    init(splashData: [SplashData]) {
        super.init(nibName: "SplashDeliveryViewController", bundle: .main)
        self.splashData = splashData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var state: DeliverySplashScreen = .buy {
        didSet {
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        state = .buy
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
    
    private func render() {
        imageView.image = UIImage(named: state.imageName)
        lbSplash.config(title: state.title, subTitle: state.subTitle, numberOfLines: state.index, image: nil)
        
        pageControl.currentPage = state.index
        pageControl.numberOfPages = DeliverySplashScreen.allCases.count
        
//        skipBtn.isHidden = (state == .quality)
        nextBtn.setTitle(state == .quality ? "Start" : "Next", for: .normal)
        
        
    }
        
    @IBAction func skipBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        let allScreens = DeliverySplashScreen.allCases
        let currentIndex = state.index
        
        
        if currentIndex < allScreens.count - 1 {
            state = allScreens[currentIndex + 1]
        }
        
        else {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }
}
