//
//  SettingsController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/12/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingsController: UIViewController ,LogoutApiCallBack, UpdateApiCallBack{
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    var firebaseModel : FirebaseModel!
    var user : User!
    var resetHasBeenClicked : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        
    }
    
    func initValues() {
        
        firebaseModel = FirebaseModel()
        resetHasBeenClicked = false
        
        
    }
    
    
    @IBAction func onLogoutButtonPressed(_ sender: UIButton) {
        
        firebaseModel.logout(apiCallBack: self)
        
    }
    
    @IBAction func onResetButtonPressed(_ sender: UIButton) {
        
        let alert = SCLAlertView().showWarning("Hello Warning", subTitle: "This is a more descriptive warning text.")
        
        firebaseModel.updateChallengeUser(userUid: user.uId, updatedChallenge: Finals.FIRST_CHALLENGE, apiCallBack: self)
        
        
    }
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        if(resetHasBeenClicked){
            
            self.performSegue(withIdentifier: Finals.CHALLANGES_PAGE, sender: self)
            
        }else {
            
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func onLogoutSuccess() {
        
        
        self.performSegue(withIdentifier: Finals.LOGIN_PAGE, sender: self)
    }
    
    func onFailure(error: Error) {
        
        Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error.localizedDescription)
    }
    
    func onUpdateSuccess() {
        
        //Update the user localy
        user.currentChallenge = 1
        resetHasBeenClicked = true
        
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Finals.LOGIN_PAGE){
            
            _ = segue.destination as! LoginController
        }
        
        if(segue.identifier == Finals.CHALLANGES_PAGE){
            
            let challangesPage = segue.destination as! ChallengesController
            challangesPage.currentUser = user
        }
        
    }
    
    
}
