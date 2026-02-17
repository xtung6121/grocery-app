import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailTextField: MTextField!
    @IBOutlet weak var sendLinkButton: ButtonCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSetup()
        textFieldSetup()
        sendLinkButtonSetup()
    }
    
    private func labelSetup() {
        titleLabel.text = "Forgot Password"
        descriptionLabel.text = "Lorem ipsum dolor sit amet,consetetur sadipscing elitr, sed diam nonumy"
        descriptionLabel.numberOfLines = 0
    }
    
    private func textFieldSetup() {
        emailTextField.style = .email
        emailTextField.placeholder = "Email address"
    }
    
    private func sendLinkButtonSetup() {
        sendLinkButton.configure(with: IconTextButtonCustom.init(text: "Send link",textColor: .white, image: nil, backgroundColor: ColorSet.primaryButton.color))
        sendLinkButton.onTap = {
            print("tap to send link")
        }
    }
}
