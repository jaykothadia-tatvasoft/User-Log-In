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
        title = "Sign Up"
        nameTextField.delegate = self
        designationTextField.delegate = self
        datePickerView.maximumDate = Date()  //disables selection of date past the current date
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
    
    //restricts any numerical entry in the both text fields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let allowedLetters = CharacterSet.letters
            let allowedWhiteSpace = CharacterSet.whitespaces
            let characterSet = CharacterSet(charactersIn: string)
            return allowedLetters.isSuperset(of: characterSet) || allowedWhiteSpace.isSuperset(of: characterSet)
    }
}
