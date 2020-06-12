//
//  SettingsController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/12/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingsController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onLogoutButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
    
    @IBAction func onResetButtonPressed(_ sender: UIButton) {
        
        let alert = SCLAlertView().showWarning("Hello Warning", subTitle: "This is a more descriptive warning text.")
        
        user.currentChallenge = 1
    }
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToLoginPage"){
            
            _ = segue.destination as! LoginController
        }
        
    }
    
    
}
