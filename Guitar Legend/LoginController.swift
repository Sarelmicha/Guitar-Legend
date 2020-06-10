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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToChallengsPage", sender: self)
    }
    
    //MARK: - Navigation
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        _ = segue.destination as! ChallengesController
            
       }


}

