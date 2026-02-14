

import UIKit

@MainActor
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupBackgroundView() {
        overrideUserInterfaceStyle = .light
        imageContainer.image = UIImage(named: "woman-with-shopping-list-standing-by-fridge-supermarket-checking-cart 1")
        imageView.image = UIImage(named: "Rectangle 39")
        imageView.contentMode = .scaleAspectFill
        imageContainer.contentMode = .scaleAspectFill
    }
    
    private func setupButtons() {
        buttonLogin.configure(with: IconTextButtonCustom.init(text: "Signup", textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
        
        rightButtonGotoSignUp.setTitleColor(.black, for: .normal)
        
        buttonLogin.onTap = { [weak self] in
            self?.didTapButtonSignUp()
        }
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
    
    private func didTapButtonSignUp() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let phone = phoneTextField.text,
              !email.isEmpty,
              phone.count >= 10,
              password.count >= 6 else {
            print("invalid input -> Password must greater or equal 6 charatacter!")
            return
        }
        
        let requestBody = RegisterRequest.init(email: email, password: password, phone: phone)
        
        Task {
            do {
                let response: RegisterResponse = try await (
                    NetworkService.shared.request(api: AuthAPI.postRegister(body: requestBody), responseType: RegisterResponse.self)
                )
                
                await handleSuccessfulRegister(response)
            } catch {
                await handleRegisterError(error)
            }
        }
    }
    
    private func handleSuccessfulRegister(_ response: RegisterResponse) async {
       print("REGISSTER SUCCESSFULLY \(response)")
        goToLogin()
    }
    
    private func handleNetworkServiceError(_ error: Error) async {
        print("REGISTER ERROR: \(error)")
    }
    
    private func handleRegisterError(_ error: Error) async {
        print("REGISTER ERROR: \(error)")
    }
    
    private func goToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        goToLogin()
    }
}
