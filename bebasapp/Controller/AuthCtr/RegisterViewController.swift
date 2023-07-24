//
//  RegisterViewController.swift
//  bebasapp
//
//  Created by Phincon on 04/07/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registerContinueBtn: UIButton!{
        didSet {
            registerContinueBtn.layer.cornerRadius = CGFloat(10)
        }
    }
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBAction func backToSignIn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        
//        let imgBackArrow = UIImage(named: "angle-small-left")
//        self.navigationController?.navigationBar.backIndicatorImage = imgBackArrow
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBackArrow
//
//        let edgeInsets = UIEdgeInsets(top: 20, left: 25, bottom: 0, right: 0)
//        self.navigationController?.navigationBar.layoutMargins = edgeInsets
//        self.navigationItem.leftItemsSupplementBackButton = true
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButton(_:)))
        
        self.navigationController?.navigationItem.hidesBackButton = true
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
    
    
    
    func invalidEmail(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    func checkFormValidation() {
        if emailError.isHidden {
            registerContinueBtn.isEnabled = true
        }
        else {
            registerContinueBtn.isEnabled = false
        }
    }
    
    func resetForm() {
        registerContinueBtn.isEnabled = false
        
        emailError.isHidden = false
        
        emailError.text = "Required"
        
        emailTextField.text = ""
    }
    
    
    
    @IBAction func registerContinueAction(_ sender: UIButton) {
        let performHome = UIStoryboard(name: "Profile&Pass", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(performHome, animated: true)
    }
   
    @objc func disabledBtn(){
        if emailTextField.text != "" {
            registerContinueBtn.isEnabled = true
            registerContinueBtn.backgroundColor = .blue
        } else  {
            registerContinueBtn.isEnabled = false
            registerContinueBtn.backgroundColor = .gray
        }
    }

 

}
