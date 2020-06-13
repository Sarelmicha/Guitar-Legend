//
//  Validator.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


class Validator {
    
    /*Check the fields and validate that the data is correct.
     If everything is correct, this method returns nil, otherwrise it return the
     error message
     */
    
    static func validateFields(emailTextFieldText : String, passwordTextFieldText : String) -> String?{
        
        //Check that all fields are fiiled in
        if(emailTextFieldText.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            return "Email cannot be empty"
        }
        if(passwordTextFieldText.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            return "Password cannot be empty"
        }
        
        //Check if the password is secure
        let cleanedPassword = passwordTextFieldText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(!isPasswordValid(password: cleanedPassword)){
            //Password isn't secure enoguh
            print("here baby")
            return "Please make sure your password is at least 8 charcters"
        }
        
        
        
        
        return nil
        
        
    }
    
    static func isPasswordValid(password : String ) -> Bool {
        
       
        return password.count >= 8
        
     
        
        
    }
}
