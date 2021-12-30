//
//  ViewController.swift
//  UserLogIn
//
//  Created by MAC108 on 27/12/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var designationTextField: UITextField!
    @IBOutlet private weak var dobTextView: UITextView!
    @IBOutlet private weak var datePickerView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Sign Up"
        nameTextField.delegate = self
        designationTextField.delegate = self
    }

    @IBAction private func didTapOnSignUp(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        loginViewController.userName = nameTextField.text ?? ""
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction private func didDateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dobTextView.textColor = .black
        dobTextView.text = dateFormatter.string(from: sender.date)
    }
    
}

extension ViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField{
            nameTextField.resignFirstResponder()
            designationTextField.becomeFirstResponder()
        }else if textField == designationTextField{
            designationTextField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (nameTextField.isFirstResponder){
            nameTextField.resignFirstResponder()
        }else if (designationTextField.isFirstResponder){
            designationTextField.resignFirstResponder()
        }
    }
    
}
