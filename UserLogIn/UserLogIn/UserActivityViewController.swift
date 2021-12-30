//
//  UserActivityViewController.swift
//  UserLogIn
//
//  Created by MAC108 on 28/12/21.
//

import UIKit

class UserActivityViewController: UIViewController {

    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .systemRed
        }else if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = .systemBlue
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
