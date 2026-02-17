
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
    @IBOutlet weak var buttonDidTap: ButtonCustom!
    
    private var splashData: [SplashData] = []
    private var splashDataFiltered: [SplashData] = []
    private var canSkipAll: Bool = false
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        fetchData()
        setupActionButton()
        updateButtonState()
    }
    
    private func setupBackground() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        customLbSplash.backgroundColor = .clear
    }
    
    private func fetchData() {
        Task { @MainActor in
            do {
                let fetchedSplashData: SplashDataResponse = try await
                NetworkService.shared.request(
                    api: SplashAPI.getSplash,
                    responseType: SplashDataResponse.self
                )
                
                self.splashData = fetchedSplashData.items
                    .sorted {$0.order < $1.order}

                self.splashDataFiltered = self.splashData
                    .filter{ $0.type == .notSkippable}
                
                self.canSkipAll = fetchedSplashData.canSkipAll
                self.updateSplashContent()
            } catch {
                print("err fetch data: ", error)
            }
        }
    }
    
    
    private func setupImage() {
        imageView.image = UIImage(named: splashDataFiltered[currentIndex].image)
    }
    private func updateButtonState() {
        _ = currentIndex == splashData.count - 1
        buttonDidTap.configure(with: IconTextButtonCustom.init(text: "Get Started",textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
    }
    
    private func updateSplashContent() {
        guard splashDataFiltered.indices.contains(currentIndex) else { return }
        setupPageContent()
        setupImage()
    }
    
    private func setupPageContent() {
        guard currentIndex < splashDataFiltered.count else { return }
        
        let items = splashDataFiltered[currentIndex]
        
        customLbSplash.config(
            title: items.title,
            subTitle: items.description,
            numberOfLines: 2,
            image: nil
        )
        
        pageControl.currentPage = currentIndex
        pageControl.numberOfPages = splashDataFiltered.count
    }
    
    private func setupActionButton() {
        buttonDidTap.onTap = { [weak self] in
            guard let self else { return }
            let isReachMaxPage = !(self.currentIndex < self.splashDataFiltered.count - 1)
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
