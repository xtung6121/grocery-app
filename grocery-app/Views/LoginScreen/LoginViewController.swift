

import UIKit

@MainActor
class LoginViewController: UIViewController {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: MTextField!
    @IBOutlet weak var passwordTextField: MTextField!
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
        setupLoginButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupBackgroundView() {
        overrideUserInterfaceStyle = .light
        imageContainer.image = UIImage(named: "portrait-female-person-supermarket-holding-fruit-smiling 1")
        imageView.contentMode = .scaleAspectFill
        imageContainer.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Rectangle 39")
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Login",textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
        rightButtonForgotPassword.setTitle("Forgot password", for: .normal)
        rightButtonForgotPassword.setTitleColor(ColorSet.forgotButton.color, for: .normal)
        rightButtonForgotPassword.titleLabel?.font = .boldSystemFont(ofSize: 15)
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
    }
    
    private func setupLoginButtonAction() {
        buttonLogin.onTap = { [weak self ] in
            self?.didTapButtonLogin()}
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
        labelQuestions.text = "Don't have an account?"
        labelQuestions.font = .thin(size: 15)
    }
    
    private func setupUITextField() {
        emailTextField.style = .email
        emailTextField.placeholder = "Email address"
        passwordTextField.style = .password
        passwordTextField.placeholder = "**********"
    }
    
    // API Endpoint
    // Response model
    // Bussiness flow
    private func didTapButtonLogin() {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty,
              password.count >= 6 else {
            print("invalid input ->> email or password too short")
            return
        }
        
        let requestBody = LoginRequest(email: email, password: password)
        Task {
            do {
                let response: LoginResponse = try await
                NetworkService.shared.request(
                    api: AuthAPI.postLogin(body: requestBody),
                    responseType: LoginResponse.self
                )
                await handleSuccessfulLogin(response)
            } catch {
                await handleLoginError(error)
            }
        }
    }
    
    private func handleSuccessfulLogin(_ response: LoginResponse) async {
        print("Login successfully: \(response)")
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleLoginError(_ error: Error) async {
        print("Login failed: \(error.localizedDescription)")
    }
    
    @IBAction func signUpDidTap(_ sender: Any) {
        let vc = SignUpController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
