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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField{
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (emailTextField.isFirstResponder){
            emailTextField.resignFirstResponder()
        }else if (passwordTextField.isFirstResponder){
            passwordTextField.resignFirstResponder()
        }
    }
    
    @IBAction func didTappedLogIn(_ sender: UIButton) {
        let userActivityViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        self.navigationController?.pushViewController(userActivityViewController, animated: true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
