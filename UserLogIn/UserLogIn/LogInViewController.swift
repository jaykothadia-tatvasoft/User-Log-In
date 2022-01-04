//
//  LogInViewController.swift
//  UserLogIn
//
//  Created by MAC108 on 27/12/21.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var userName : String = ""
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Log In"
        if(userName != ""){
            userNameLable.text = "Hello \(userName)!!!"
        }
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func didTappedLogIn(_ sender: UIButton) {
        let userActivityViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        
        //Email validation and textfield validation
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alert = UIAlertController(title: "Empty Fields", message: "Please fill all fields", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true)
        }else if (emailTextField.text?.isValidEmail)! == false {
            let alert = UIAlertController(title: "Invalid Email", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true)
        }else{
            self.navigationController?.pushViewController(userActivityViewController, animated: true)
        }
    }
}

extension String {
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
