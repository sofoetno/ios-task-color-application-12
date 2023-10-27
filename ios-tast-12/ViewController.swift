import UIKit

class ViewController: UIViewController {
    private var backgroundImage: UIImageView?
    private var rootStack: UIStackView?
    private var profileImage: UIImageView?
    private var label: UILabel?
    private var emailField: TextFieldWithPadding?
    private var passwordField: TextFieldWithPadding?
    private var forgotPasswordLabel: UILabel?
    private var signInButton: ButtonWithPadding?
    
    private var separatorStack: UIStackView?
    private var separatorLeftLine: UIView?
    private var separatorOr: UILabel?
    private var separatorRightLine: UIView?
    
    private var socialLoginStack: UIStackView?
    private var googleButton: ButtonWithPadding?
    private var facebookButton: ButtonWithPadding?
    private var linkedInButton: ButtonWithPadding?
    
    private var dontHaveAccountLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        backgroundImage = UIImageView(image: UIImage(named: "rectangle_bg"))
        
        view.addSubview(backgroundImage!)
        
        rootStack = UIStackView()
        rootStack?.axis = .vertical
        rootStack?.spacing = 15
        rootStack?.alignment = .center
        rootStack?.distribution = .equalCentering
        
        profileImage = UIImageView(image: UIImage(named: "profile-image"))
        
        label = UILabel()
        label?.text = "Sign In"
        label?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label?.font = UIFont.systemFont(ofSize: 28)
        
        emailField = TextFieldWithPadding()
        configureField(field: &emailField)
        emailField?.placeholder = "Email"
        
        passwordField = TextFieldWithPadding()
        configureField(field: &passwordField)
        passwordField?.placeholder = "Password"
        
        
        signInButton = ButtonWithPadding()
        signInButton?.frame = CGRect(x: 0, y: 0, width: 292, height: 45)
        signInButton?.layer.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1).cgColor
        signInButton?.layer.cornerRadius = 30
        signInButton?.setTitle("Sign In", for: .normal)
        signInButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signInButton?.setPadding(top: 20, left: 16, bottom: 20, right: 16)
        
        signInButton?.addAction(UIAction(handler: { [weak self] action in
            let email = self?.emailField?.text
            let password = self?.passwordField?.text
            if email != nil && email != "" && password != nil && password != "" {
                self?.navigationController?.pushViewController(ColorButtonsViewController(), animated: true)
            }
        }), for: .touchUpInside)
        
        
        forgotPasswordLabel = UILabel()
        forgotPasswordLabel?.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        forgotPasswordLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordLabel?.textAlignment = .right
        forgotPasswordLabel?.text = "Forgot Your Password?"
        
        
        separatorStack = UIStackView()
        separatorStack?.axis = .horizontal
        separatorStack?.spacing = 8
        separatorStack?.alignment = .center
        
        separatorLeftLine = UIView()
        separatorLeftLine?.backgroundColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)

        separatorOr = UILabel()
        separatorOr?.text = "Or"
        separatorOr?.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        
        separatorRightLine = UIView()
        separatorRightLine?.frame = CGRect(x: 0, y: 0, width: 120, height: 1)
        
        separatorRightLine?.backgroundColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        
        separatorStack?.addArrangedSubview(separatorLeftLine!)
        separatorStack?.addArrangedSubview(separatorOr!)
        separatorStack?.addArrangedSubview(separatorRightLine!)
        
        separatorLeftLine?.translatesAutoresizingMaskIntoConstraints = false
        separatorLeftLine?.widthAnchor.constraint(equalToConstant: 120).isActive = true
        separatorLeftLine?.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorOr?.translatesAutoresizingMaskIntoConstraints = false
        separatorOr?.heightAnchor.constraint(equalToConstant: 17).isActive = true
        separatorRightLine?.translatesAutoresizingMaskIntoConstraints = false
        separatorRightLine?.widthAnchor.constraint(equalToConstant: 120).isActive = true
        separatorRightLine?.heightAnchor.constraint(equalToConstant: 1).isActive = true

        
        socialLoginStack = UIStackView()
        socialLoginStack?.axis = .horizontal
        socialLoginStack?.spacing = 11
        googleButton = ButtonWithPadding()
        if let image = UIImage(named: "devicon_google") {
            googleButton?.setImage(image, for: .normal)
        }
        googleButton?.setPadding(top: 6, left: 6, bottom: 6, right: 6)
        facebookButton = ButtonWithPadding()
        if let image = UIImage(named: "bxl_facebook") {
            facebookButton?.setImage(image, for: .normal)
        }
        facebookButton?.setPadding(top: 6, left: 6, bottom: 6, right: 6)
        linkedInButton = ButtonWithPadding()
        if let image = UIImage(named: "devicon_linkedin") {
            linkedInButton?.setImage(image, for: .normal)
        }
        linkedInButton?.setPadding(top: 6, left: 6, bottom: 6, right: 6)
        
        socialLoginStack?.addArrangedSubview(googleButton!)
        socialLoginStack?.addArrangedSubview(facebookButton!)
        socialLoginStack?.addArrangedSubview(linkedInButton!)
        
        
        rootStack?.addArrangedSubview(profileImage!)
        rootStack?.addArrangedSubview(label!)
        rootStack?.addArrangedSubview(emailField!)
        rootStack?.addArrangedSubview(passwordField!)
        rootStack?.addArrangedSubview(forgotPasswordLabel!)
        rootStack?.addArrangedSubview(signInButton!)
        rootStack?.addArrangedSubview(separatorStack!)
        rootStack?.addArrangedSubview(socialLoginStack!)
        
        
        rootStack?.setCustomSpacing(32, after: label!)
        rootStack?.setCustomSpacing(32, after: forgotPasswordLabel!)
        rootStack?.setCustomSpacing(32, after: signInButton!)
        
        emailField?.leadingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
        emailField?.trailingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        
        passwordField?.leadingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
        passwordField?.trailingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        
        forgotPasswordLabel?.trailingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        
        signInButton?.leadingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
        signInButton?.trailingAnchor.constraint(equalTo: (rootStack?.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        
        
        separatorStack?.translatesAutoresizingMaskIntoConstraints = false
        separatorStack?.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        
        view.addSubview(rootStack!)
        
        
        dontHaveAccountLabel = UILabel()
        dontHaveAccountLabel?.frame = CGRect(x: 0, y: 0, width: 203, height: 17)
        dontHaveAccountLabel?.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        dontHaveAccountLabel?.font = UIFont.systemFont(ofSize: 14)
        dontHaveAccountLabel?.text = "Don’t have an account.Sign Up"
        
        view.addSubview(dontHaveAccountLabel!)
        
        
        backgroundImage?.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        rootStack?.translatesAutoresizingMaskIntoConstraints = false
        rootStack?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        rootStack?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        rootStack?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        rootStack?.bottomAnchor.constraint(equalTo: dontHaveAccountLabel!.bottomAnchor, constant: -65).isActive = true
        
        
        dontHaveAccountLabel?.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccountLabel?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        dontHaveAccountLabel?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func configureField(field: inout TextFieldWithPadding?) {
        field?.layer.cornerRadius = 16
        field?.layer.borderWidth = 1
        field?.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        field?.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1).cgColor
    }
}

