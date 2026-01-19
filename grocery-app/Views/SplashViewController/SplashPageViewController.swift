
import UIKit

enum SplashWithNoSkipButton {
    case splashWithSkipButton
    case splashNoSkipButton
}
class SplashPageViewController: UIViewController {
    
    @IBOutlet weak var customLbSplash: CustomLbSplash!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonDidTap: ButtonSplashCustom!
    @IBOutlet weak var splashTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var splashBottomConstraint: NSLayoutConstraint!
    
    private var splashData: [SplashData] = []
    private var currentIndex: Int = 0
    
    private func fetchData() {
            Task { @MainActor in
                do {
                    let fetchedData: SplashDataRespone = try await NetworkService.shared.request(api: .getSplash, responseType: SplashDataRespone.self)
                    self.splashData = fetchedData.items
                } catch {
                    print("err fetch data: ", error)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        
        fetchData()
        setupActionButtonDidTap()
        
        
    }
        
    private func render() {
        guard currentIndex < splashData.count else { return }
        
        let items = splashData[currentIndex]
        
        customLbSplash.config(
            title: items.title,
            subTitle: items.description,
            numberOfLines: 2, image: items.image
        )
        
        pageControl.currentPage = currentIndex
        pageControl.numberOfPages = splashData.count
        
    }
    
    
    private func setupActionButtonDidTap() {
        buttonDidTap.buttonDidTap = { [weak self] in
                        guard let self else { return }
            
                if self.currentIndex < self.splashData.count - 1 {
                    self.currentIndex += 1
                    self.render()
                }
            else {
                self.navigationController?.pushViewController(SplashDeliveryViewController(), animated: true)
                }
        }
    }
    

}
