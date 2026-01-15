
import UIKit

enum SplashScreenType: CaseIterable {
    case first
    case second
    case third
    case welcome
    
    var title: String {
        switch self {
        case .first: return "Xin chao page 1"
        case .second: return "page 2"
        case .third: return "Let's Start"
        case .welcome:
            return "Let's start"
        }
    }
    
    var subtite: String {
        switch self {
        case .welcome:
            return "hello"
        default:
            return "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
        }
    }
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
    
   
}

class SplashPageViewController: UIViewController {
    
    @IBOutlet weak var customLbSplash: CustomLbSplash!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonDidTap: ButtonSplashCustom!
    @IBOutlet weak var viewHeader: UIView!
    
    private var state: SplashScreenType = .first {
        didSet {
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        render()
        setupActionButtonDidTap()
    }
    
    private func render() {
        customLbSplash.config(
            title: state.title,
            subTitle: state.subtite,
            numberOfLines: 2
        )
        
        pageControl.currentPage = state.index
        pageControl.numberOfPages = SplashScreenType.allCases.count
        
        
    }
    
    private func setupActionButtonDidTap() {
        buttonDidTap.buttonDidTap = {
            let allScreens = SplashScreenType.allCases
            let currentIndex = self.state.index
            
            
            if currentIndex < allScreens.count - 1 {
                self.state = allScreens[currentIndex + 1]
            }
            
            else {
                self.navigationController?.pushViewController(SplashDeliveryViewController(), animated: true)
                }
        }
    }
    

}
