

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var forgotPassView: UIView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundWhite: UIView!
    @IBOutlet weak var emailTextField: MTextField!
    @IBOutlet weak var passwordTextField: MTextField!
    @IBOutlet weak var ghostView: UIView!
    @IBOutlet weak var customLabel: CustomLabel!
    @IBOutlet weak var buttonLogin: ButtonCustom!
    @IBOutlet weak var rightButtonForgotPassword: UIButton!
    @IBOutlet weak var leftButtonNotCheckorChecked: UIButton!
    @IBOutlet weak var labelLeftCheck: UILabel!
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
            viewHeader,
            customLabel,
            emailTextField,
            passwordTextField,
            forgotPassView,
            backgroundViewBottom
        ]
        clearViews.forEach{$0.backgroundColor = .clear }
        imageContainer.image = UIImage(named: "portrait-female-person-supermarket-holding-fruit-smiling 1")
        imageView.image = UIImage(named: "Rectangle 39")
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Login",textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
        
        rightButtonForgotPassword.setTitle("Forgot password", for: .normal)
        rightButtonForgotPassword.setTitleColor(ColorSet.forgotButton.color, for: .normal)
        
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
    }
    
    private func setupTexts() {
        customLabel.applyConfiguration(
            title: "Welcome Back",
            subTitle: "Sign in to your account",
            titleNumberOfLines: 1,
            subTitleNumberOfLines: 1
        )

        labelLeftCheck.text = "Remember me"
        labelLeftCheck.font = .systemFont(ofSize: 15, weight: .thin)
        rightButtonForgotPassword.setTitleColor(.blue, for: .normal)
        rightButtonForgotPassword.titleLabel?.font = .boldSystemFont(ofSize: 15)
        labelQuestions.text = "Don't have an account?"
        labelQuestions.font = .thin(size: 15)
    }
    
    private func setupUITextField() {
        emailTextField.style = .email
        emailTextField.placeholder = "Email address"
        passwordTextField.style = .password
        passwordTextField.placeholder = "**********"
    }
    
    @IBAction func signUpDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(SignUpController(), animated: true)
    }
    

}
