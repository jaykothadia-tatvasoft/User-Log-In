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
        
        //Email validation
        if (emailTextField.text?.isValidEmail)! {
            self.navigationController?.pushViewController(userActivityViewController, animated: true)
        }else{
            print("Email is not valid")
        }
        
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

extension String {
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
