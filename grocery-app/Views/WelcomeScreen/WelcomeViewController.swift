

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundWhite: UIView!
    @IBOutlet weak var customLabel: CustomLabel!
    @IBOutlet weak var buttonLogin: ButtonCustom!
    @IBOutlet weak var buttonCreateAccount: ButtonCustom!
    @IBOutlet weak var goToLoginBtn: UIButton!
    @IBOutlet weak var backgroundViewBottom: UIView!
    @IBOutlet weak var labelQuestions: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupButtons()
        setupBackgroundView()
        bindActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupBackgroundView() {
        overrideUserInterfaceStyle = .light
        let clearViews: [UIView] = [
            backgroundWhite,
            customLabel,
            backgroundViewBottom
        ]
        clearViews.forEach{$0.backgroundColor = .clear }
        imageContainer.image = UIImage(named: "woman-with-shopping-list-standing-by-fridge-supermarket-checking-cart 1")
        imageView.image =   UIImage(named: "Rectangle 39")
        imageView.contentMode = .scaleAspectFill
        imageContainer.contentMode = .scaleAspectFill
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Continue with google", textColor: .black, image: UIImage(named: "Group 4"), backgroundColor: .white))
        
        buttonCreateAccount.configure(with: IconTextButtonCustom.init(text: "Create an account", textColor: .white, image: UIImage(named: "accountImage"), backgroundColor: ColorSet.primaryButton.color))
        
        goToLoginBtn.setTitle("Login", for: .normal)
        goToLoginBtn.setTitleColor(.black, for: .normal)
    }
    
    private func setupTexts() {
        customLabel.applyConfiguration(
            title: "Welcome",
            subTitle: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            titleNumberOfLines: 1,
            subTitleNumberOfLines: 2
        )

        labelQuestions.text = "Already have an account?"
    }
    
    private func gotoSignIn() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    

    private func bindActions() {
        buttonLogin.onTap = { [weak self] in
            self?.gotoSignIn()
        }
        buttonCreateAccount.onTap = {
            self.navigationController?.pushViewController(SignUpController(), animated: true)
        }
    }
}
