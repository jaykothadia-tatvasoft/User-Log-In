//
//  LogInViewController.swift
//  UserLogIn
//
//  Created by MAC108 on 27/12/21.
//

import UIKit

class LogInViewController: UIViewController {
    
    var userName : String = ""
    @IBOutlet private weak var userNameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Log In"
        if(userName != ""){
            userNameLable.text = "Hello \(userName)!!!"
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
