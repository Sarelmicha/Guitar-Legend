//
//  SplashController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/14/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class SplashController: UIViewController, SignInApiCallBack {
    
    
    var firebaseModel : FirebaseModel!
    var currentUser : User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firebaseModel.autoSignIn(apiCallBack: self)

    }
    
    
    func initValues() {
        firebaseModel = FirebaseModel()
    }
    
    func onSignInSuccess(userUid: String) {
        firebaseModel.getUser(userUid: userUid,apiCallBack: self)
    }
    
    func onGetUserSuccess(user: User) {
        print("autologin success")
        //Navigate to challenges page
        currentUser = user
        self.performSegue(withIdentifier: Finals.CHALLANGES_PAGE, sender: self)
    }
    
    func onFailure(error: Error?) {
        
        print("autologin failed")
        
        self.performSegue(withIdentifier: Finals.LOGIN_PAGE, sender: self)
        
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Finals.LOGIN_PAGE){
            
            _ = segue.destination as! LoginController
            
        } else if(segue.identifier == Finals.CHALLANGES_PAGE){
            
            let challengePage = segue.destination as! ChallengesController
            challengePage.currentUser = currentUser
        }
        
    }
    
    
}
