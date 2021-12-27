//
//  ViewController.swift
//  UserLogIn
//
//  Created by MAC108 on 27/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        title = "Sign Up"
    }

    @IBAction private func didTapOnSignUp(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        //loginViewController.sample = "Hello"
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}

