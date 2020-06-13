//
//  ViewController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/9/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSignupButtonPressed(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "goToSignupPage", sender: self)
    }
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToChallengsPage", sender: self)
    }
    
    //MARK: - Navigation
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToChallengsPage"){
        
        let challengePage = segue.destination as! ChallengesController
        challengePage.currentUser = User(id: 1, currentChallenge: 1)
        } else if(segue.identifier == "goToSignupPage"){
            
            
            
            _ = segue.destination as! SignupController
        }
            
       }


}

