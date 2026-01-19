
import UIKit

enum SplashWithNoSkipButton {
    case splashWithSkipButton
    case splashNoSkipButton
}

// TODO :
// Add new Splash Screen
// Add 1 cái loading cho tất cả màn -> Indicator
// Custom lại logic Introduce
// Customn lại Delivery page nhận data
// Welcome - Sigin - Signout

class SplashPageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customLbSplash: CustomLbSplash!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonDidTap: ButtonSplashCustom!
    @IBOutlet weak var splashTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var splashBottomConstraint: NSLayoutConstraint!
    
    private var splashData: [SplashData] = []
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        fetchData()
        setupActionButton()
    }
    
    private func setupBackground() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
    }

    private func fetchData() {
        Task { @MainActor in
            do {
                let fetchedData: SplashDataRespone = try await NetworkService.shared.request(api: .getSplash, responseType: SplashDataRespone.self)
                self.splashData = fetchedData.items
                self.updateSplashContent()
            } catch {
                print("err fetch data: ", error)
            }
        }
    }
    
    private func setupImage() {
        imageView.image = UIImage(named: splashData[currentIndex].image)
    }
        
    
    private func updateSplashContent() {
        setupPageContent()
        setupImage()
    }
    
    private func setupPageContent() {
        guard currentIndex < splashData.count else { return }
        
        let items = splashData[currentIndex]
        
        customLbSplash.config(
            title: items.title,
            subTitle: items.description,
            numberOfLines: 2, image: nil
        )
        
        pageControl.currentPage = currentIndex
        pageControl.numberOfPages = splashData.count
    }
    
    private func setupActionButton() {
        buttonDidTap.buttonDidTap = { [weak self] in
            guard let self else { return }
            let isReachMaxPage = !(self.currentIndex < self.splashData.count - 1)
            if isReachMaxPage {
                self.pushToDeliveryPage()
            }
            else {
                self.updateNextPage()
            }
        }
    }
    
    private func updateNextPage() {
        self.currentIndex += 1
        self.updateSplashContent()
    }
    
    private func pushToDeliveryPage() {
        self.navigationController?.pushViewController(SplashDeliveryViewController(splashData: splashData), animated: true)
    }
}
