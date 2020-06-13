//
//  FirebaseModel.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase


class FirebaseModel {
    
    func signUp(email : String, password : String)  {
        
        
        
        Auth.auth().createUser(withEmail: email, password: password)  {(result,err) in
            
            //Check for errors
            if (err != nil) {
                
                // There was an error creating the user
                //Utilities.createErrorMessage(errorTitle: "Error", errorMessage: err)
            } else {
                
                //User created seccessfully, not store id and the current challenge
            
               
                
            }
            
        }
        
        
        
    }
    
    
}
