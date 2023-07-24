//
//  ViewController.swift
//  bebasapp
//
//  Created by Phincon on 03/07/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //Email Text Field
    @IBOutlet weak var emailTextField: UITextField!
    
    //Password Text Field
    @IBOutlet weak var passwordTextField: UITextField!
    
    //email error
    @IBOutlet weak var emailError: UILabel!
    
    //password error
    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var signInBtn: UIButton! {
        didSet {
            signInBtn.layer.cornerRadius = CGFloat(10)
        }
    }
    
    @IBOutlet weak var signUp: UIButton!
    
    //Language Localizable
    @IBOutlet weak var welcomeBack: UILabel!
    @IBOutlet weak var silakanMasukan: UILabel!
    @IBOutlet weak var emailPhone: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    @IBAction func hideButton(_ sender: UIButton) {
        let isHidden = passwordTextField.isSecureTextEntry
        
        passwordTextField.isSecureTextEntry = !isHidden
        
        let imageName = isHidden ?  "ic_hide_pass" : "ic_view_pass"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTextField.text
        {
            if let errorMessage = invalidEmail(email) {
                emailError.text = errorMessage
                emailError.isHidden = false
            } else {
                emailError.isHidden = true
            }
        }
        checkFormValidation()
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTextField.text
        {
            if let errorMessage = invalidPassword(password)
                        {
                            passwordError.text = errorMessage
                            passwordError.isHidden = false
                        }
                        else
                        {
                            passwordError.isHidden = true
                        }
        }
        checkFormValidation()
        
    }
    
    func checkFormValidation() {
        if emailError.isHidden && passwordError.isHidden {
            signInBtn.isEnabled = true
        }
        else {
            signInBtn.isEnabled = false
        }
    }
    
    func invalidEmail(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    func invalidPassword(_ value: String) -> String? {
        if value.count < 8 {
            return "Password must contain at least 8 characters"
        }
        return nil
    }

    
    func resetForm() {
        signInBtn.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        
        emailError.text = "Required"
        passwordError.text = "Required"
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        
        let performHome = UIStoryboard(name: "ResetPass", bundle: nil).instantiateViewController(withIdentifier: "ResetViewController") as! ResetViewController
        self.navigationController?.pushViewController(performHome, animated: true)
        
    }
    
    //Signup Button
    @IBAction func SignUpAction(_ sender: UIButton) {
        
        let performHome = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(performHome, animated: true)
        
    }
    
    //SignIn Button
    @IBAction func SignInAction(_ sender: UIButton) {
        resetForm()
        let performHome = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabController") as! TabController
        self.navigationController?.pushViewController(performHome, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        
        
        
        navigationItem.title = ""
        changeLanguage()
    }
    
    @objc func disabledBtn(){
        if passwordTextField.text != "" && emailTextField.text != "" {
            signInBtn.isEnabled = true
            signInBtn.backgroundColor = .blue
        } else  {
            signInBtn.isEnabled = false
            signInBtn.backgroundColor = .gray
        }
    }
    
    func changeLanguage() {
        welcomeBack.text = NSLocalizedString("welcome_back", comment: "Welcome Back Label")
        forgotPasswordButton.setTitle(NSLocalizedString("forgot_button", comment: "Forgot Password Button"), for: .normal)
        emailTextField.placeholder = NSLocalizedString("email_text_field", comment: "Placeholder Email Text Field")
        
    }
    //.text (label)
    //.placeholder (textField)
    //.button (setTitle)
    
}


