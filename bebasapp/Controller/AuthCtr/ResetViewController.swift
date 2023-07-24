//
//  ResetViewController.swift
//  bebasapp
//
//  Created by Phincon on 04/07/23.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!{
        didSet{
            resetButton.layer.cornerRadius = CGFloat(10)
        }
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
    
    
    func checkFormValidation() {
        if emailError.isHidden {
            resetButton.isEnabled = true
        }
        else {
            resetButton.isEnabled = false
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
    
    func resetForm() {
        resetButton.isEnabled = false
        
        emailError.isHidden = false
        
        emailError.text = "Required"
        emailTextField.text = ""
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetForm()
        let performHome = UIStoryboard(name: "UpdatePass", bundle: nil).instantiateViewController(withIdentifier: "UpdatePassViewController") as! UpdatePassViewController
        self.navigationController?.pushViewController(performHome, animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    @objc func disabledBtn(){
        if emailTextField.text != "" {
            resetButton.isEnabled = true
            resetButton.backgroundColor = .blue
        } else  {
            resetButton.isEnabled = false
            resetButton.backgroundColor = .gray
        }
    }

}
