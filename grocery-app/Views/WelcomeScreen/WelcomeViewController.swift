

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundWhite: UIView!
    @IBOutlet weak var customLabel: CustomLabel!
    @IBOutlet weak var buttonLogin: ButtonCustom!
    @IBOutlet weak var buttonCreateAccount: ButtonCustom!
    @IBOutlet weak var rightButtonGotoSignUp: UIButton!
    @IBOutlet weak var backgroundViewBottom: UIView!
    @IBOutlet weak var labelQuestions: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupButtons()
        bindActions()
        setupBackgroundView()
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
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Continue with google", textColor: .black, image: UIImage(named: "Group 4"), backgroundColor: .white))
        
        buttonCreateAccount.configure(with: IconTextButtonCustom.init(text: "Create an account", textColor: .white, image: UIImage(named: "accountImage"), backgroundColor: ColorSet.primaryButton.color))
        
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
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
    

    @objc private func bindActions() {
        buttonLogin.onTap = {
            print("heelloo checked")
        }
        buttonCreateAccount.onTap = {
            print("Create account tapped")
        }
    }
    


//    @IBAction func signUpDidTap(_ sender: Any) {
//        self.navigationController?.pushViewController(SignUpController(), animated: true)
//    }
    

}
