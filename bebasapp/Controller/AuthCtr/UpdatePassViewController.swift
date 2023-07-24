//
//  UpdatePassViewController.swift
//  bebasapp
//
//  Created by Phincon on 04/07/23.
//

import UIKit

class UpdatePassViewController: UIViewController {

    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    
    @IBOutlet weak var saveUpdate: UIButton!{
        didSet{
            saveUpdate.layer.cornerRadius = CGFloat(10)
        }
    }
    
    @IBAction func hideNewPass(_ sender: UIButton) {
        let isHidden = newPassword.isSecureTextEntry
        newPassword.isSecureTextEntry = !isHidden
        
        let imageName = isHidden ? "ic_hide_pass" : "ic_view_pass"
        
        sender.setImage(UIImage(named: imageName), for: .normal)
        
    }
    
    @IBAction func hideConfirmPass(_ sender: UIButton) {
        let isHidden = confirmPass.isSecureTextEntry
        confirmPass.isSecureTextEntry = !isHidden
        
        let imageName = isHidden ? "ic_hide_pass" : "ic_view_pass"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func saveupdate(_ sender: Any) {
        let performHome = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabController") as! TabController
        self.navigationController?.pushViewController(performHome, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmPass.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        newPassword.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        //saveUpdate.addTarget(self, action: #selector(saveUpdate), for: .touchUpInside)
       
    }
    
    @objc func disabledBtn(){
//        print("\(confirmPass.text) - \(newPassword.text)")
        if !confirmPass.hasText, !newPassword.hasText {
            saveUpdate.isEnabled = false
            saveUpdate.backgroundColor = .gray
            return
        }
        
        if confirmPass.text == newPassword.text{
            saveUpdate.isEnabled = true
            saveUpdate.backgroundColor = .blue
        } else  {
            saveUpdate.isEnabled = false
            saveUpdate.backgroundColor = .gray
        }
        
    }
    
  

}
