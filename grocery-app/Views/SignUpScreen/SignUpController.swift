

import UIKit

class SignUpController: UIViewController {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundWhite: UIView!
    @IBOutlet weak var emailTextField: MTextField!
    @IBOutlet weak var passwordTextField: MTextField!
    @IBOutlet weak var phoneTextField: MTextField!
    @IBOutlet weak var customLabel: CustomLabel!
    @IBOutlet weak var buttonLogin: ButtonCustom!
    @IBOutlet weak var rightButtonGotoSignUp: UIButton!
    @IBOutlet weak var backgroundViewBottom: UIView!
    @IBOutlet weak var labelQuestions: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupButtons()
        setupBackgroundView()
        setupUITextField()
    }
    
    private func setupBackgroundView() {
        overrideUserInterfaceStyle = .light
        let clearViews: [UIView] = [
            backgroundWhite,
            customLabel,
            emailTextField,
            passwordTextField,
            backgroundViewBottom
        ]
        clearViews.forEach{$0.backgroundColor = .clear }
        imageContainer.image = UIImage(named: "woman-with-shopping-list-standing-by-fridge-supermarket-checking-cart 1")
        imageView.image = UIImage(named: "Rectangle 39")
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Signup", textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
        
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
    }
    
    private func setupTexts() {
        customLabel.applyConfiguration(
            title: "Create account",
            subTitle: "Quickly create account",
            titleNumberOfLines: 1,
            subTitleNumberOfLines: 1
        )

        labelQuestions.text = "Already have an account?"
        rightButtonGotoSignUp.setTitle("Sign In", for: .normal)
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
    }
    
    private func setupUITextField() {
        emailTextField.style = .email
        emailTextField.placeholder = "Email Address"
        
        passwordTextField.style = .password
        passwordTextField.placeholder = "*******"
        
        phoneTextField.style = .phone
        phoneTextField.placeholder = "Phone number"
        
    }

}
