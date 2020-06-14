//
//  ViewController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/9/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class LoginController: UIViewController , SignInApiCallBack {
    

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var firebaseModel : FirebaseModel!
    var currentUser : User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        setInfo()
       
    }
    
    func initValues() {
        
        firebaseModel = FirebaseModel()
        
        
    }
    
    func setInfo() {
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: Finals.EMAIL_HINT,
                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: Finals.PASSWORD_HINT,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    
    
    @IBAction func onSignupButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: Finals.SIGNUP_PAGE, sender: self)
    }
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        
        firebaseModel.login(emailText: emailTextField.text!, passwordText: passwordTextField.text!, apiCallBack: self)
        
    }
    
    func onSignInSuccess(userUid: String) {
        firebaseModel.getUser(userUid: userUid,apiCallBack: self)
        
    }
    
    func onGetUserSuccess(user: User) {
        
        //Navigate to challenges page
        currentUser = user
        self.performSegue(withIdentifier: Finals.CHALLANGES_PAGE, sender: self)
    }
    
    func onFailure(error: Error?) {
        
       
        Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error!.localizedDescription)
        
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Finals.CHALLANGES_PAGE){
            
            let challengePage = segue.destination as! ChallengesController
            challengePage.currentUser = currentUser
        } else if(segue.identifier == Finals.SIGNUP_PAGE){
            
            _ = segue.destination as! SignupController
        }
        
    }
    
    
}

