//
//  ProfileViewController.swift
//  bebasapp
//
//  Created by Phincon on 04/07/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var referralCode: UITextField!
    @IBOutlet weak var confirmation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullName.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
        
        password.addTarget(self, action: #selector(disabledBtn), for: .editingChanged)
    }
    
    @IBAction func hideButton(_ sender: UIButton) {
        
        let isHidden = password.isSecureTextEntry
        password.isSecureTextEntry = !isHidden
        
        let imageName = isHidden ? "ic_hide_pass" : "ic_view_pass"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func confirmationAction(_ sender: UIButton) {
        let performHome = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabController") as! TabController
        self.navigationController?.pushViewController(performHome, animated: true)
    }
    
    @objc func disabledBtn(){
        if password.text != "" && fullName.text != ""
        {
            confirmation.isEnabled = true
            confirmation.backgroundColor = .blue
        } else  {
            confirmation.isEnabled = false
            confirmation.backgroundColor = .gray
        }
    


}
}
