//
//  SignupController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class SignupController: UIViewController , ApiCallBack{
    
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var firebaseModel : FirebaseModel!
    var newUser : User!
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseModel = FirebaseModel()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignupButtonPressed(_ sender: UIButton) {
        
        //Validate the fields
        let error =  Validator.validateFields(emailTextFieldText: emailTextField.text!, passwordTextFieldText: passwordTextField.text!)
        
        if(error != nil){
            //There's somthing wrong with the fields, show error message
            Utilities.createErrorMessage(errorTitle: "Error", errorMessage: error!)
            return
        }
        
        //Create new user
        firebaseModel.signUp(emailText: emailTextField.text!, passwordText: passwordTextField.text!,apiCallBack: self)
    
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
        
        
        if(segue.identifier == "goToChallengesPage") {
            
            let challengsPage = segue.destination as! ChallengesController
            challengsPage.currentUser = newUser
        }
        
    }
    
    func onSuccess(userUid : String) {
        
        newUser = firebaseModel.read(userUid: userUid)
        
        //Navigate to challenges page               
        self.performSegue(withIdentifier: "goToChallengesPage", sender: self)

    }
    
    func onFailure(error: Error) {
        
        Utilities.createErrorMessage(errorTitle: "Error", errorMessage: error.localizedDescription)

        
    }
    
    
}
