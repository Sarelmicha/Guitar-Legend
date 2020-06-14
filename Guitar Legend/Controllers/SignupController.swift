//
//  SignupController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class SignupController: UIViewController , SignInApiCallBack{
    
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    var firebaseModel : FirebaseModel!
    var newUser : User!
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
        
        
        if(segue.identifier == Finals.CHALLANGES_PAGE) {
            
            let challengsPage = segue.destination as! ChallengesController
            challengsPage.currentUser = newUser
        }
        
    }

    
    func onSignInSuccess(userUid: String) {
        
        firebaseModel.getUser(userUid: userUid,apiCallBack: self)
    }
    
    func onGetUserSuccess(user: User) {
           //Navigate to challenges page
            newUser = user
        self.performSegue(withIdentifier: Finals.CHALLANGES_PAGE, sender: self)
       }
    
    func onFailure(error: Error?) {
        
    
            Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error!.localizedDescription)
        
    }

}
