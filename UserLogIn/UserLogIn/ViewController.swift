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
    @IBOutlet weak var dobTextField: UITextField!
    private var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        nameTextField.delegate = self
        designationTextField.delegate = self
        dobTextField.delegate = self
        
        // setting up date picker
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(setDate), for: .valueChanged)
        
        // assigning datepicker as inputview
        dobTextField.inputView = datePicker
    }

    @IBAction private func didTapOnSignUp(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        if nameTextField.text == "" || designationTextField.text == "" || dobTextField.text == "" {
            showAlert()
        }
        loginViewController.userName = nameTextField.text ?? ""
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc
    private func setDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dobTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    private func showAlert(){
        let alert = UIAlertController(title: "Empty Fields", message: "Please fill all fields", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension ViewController {
    //restricts any numerical entry in the both text fields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == nameTextField) || (textField == designationTextField) {
            let allowedLetters = CharacterSet.letters
            let allowedWhiteSpace = CharacterSet.whitespaces
            let characterSet = CharacterSet(charactersIn: string)
            return allowedLetters.isSuperset(of: characterSet) || allowedWhiteSpace.isSuperset(of: characterSet)
        }else{
            return true
        }
    }
}
