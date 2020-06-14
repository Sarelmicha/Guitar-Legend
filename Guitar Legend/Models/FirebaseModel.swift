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
import FirebaseCore
import FirebaseFirestore


class FirebaseModel  {
    
    
    func login(emailText : String, passwordText :String,apiCallBack : SignInApiCallBack) {
        
        //Validate the fields
        let error =  Validator.validateFields(emailTextFieldText: emailText, passwordTextFieldText: passwordText)
        
        if(error != nil){
            //There's somthing wrong with the fields, show error message
            Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error!)
            return
        }
        
        
        //Create cleaned verstions of the text fields
        let email = emailText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            if (err != nil) {
                //Could not sign in
                apiCallBack.onFailure(error: err!)
            } else {
                
                apiCallBack.onSignInSuccess(userUid: (result?.user.uid)!)
            }
        }
        
    }
    
    func logout(apiCallBack : LogoutApiCallBack) {
        
        
        do {
            try Auth.auth().signOut()
            apiCallBack.onLogoutSuccess()
            
        }
        catch {
            
            apiCallBack.onFailure(error: error)
            
        }
        
    }
    
    
    
    func getUser(userUid: String, apiCallBack : SignInApiCallBack){
        
        let db = Firestore.firestore()
        
        // Get data
        let docRef = db.collection("users").document(userUid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                apiCallBack.onGetUserSuccess(user: User.toUser(json: docData!))
                
                // Do something with doc data
            } else {
                print("Document does not exist")
                
            }
        }
    }
    
    func updateChallengeUser(userUid: String,currentChallenge : Int, apiCallBack : UpdateApiCallBack ) {
        
        
        let newCurrectChallenge = currentChallenge + 1
        let db = Firestore.firestore()
        
        db.collection("users").document(userUid).updateData(
        ["currentChallenge" : newCurrectChallenge]) {(err) in
            
            
            //Check for errors
            if (err != nil) {
                
                // There was an error creating the user
                apiCallBack.onFailure(error: err!)
                
            } else {
                
                //Update user success
                apiCallBack.onUpdateSuccess()
            }
        }
    }
    
    
    func signUp(emailText : String, passwordText :String,apiCallBack : SignInApiCallBack) {
        
        //Validate the fields
        let error =  Validator.validateFields(emailTextFieldText: emailText, passwordTextFieldText: passwordText)
        
        if(error != nil){
            //There's somthing wrong with the fields, show error message
            Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error!)
            return
        }
        
        
        //Create cleaned versions of the data
        let email = emailText.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().createUser(withEmail: email, password: password)  {(result,err) in
            
            //Check for errors
            if (err != nil) {
                
                // There was an error creating the user
                apiCallBack.onFailure(error: err!)
                
            } else {
                
                //User created seccessfully, not store id and the current challenge
                let db = Firestore.firestore()
                
                db.collection("users").document(result!.user.uid).setData(
                    ["uId" : result!.user.uid,
                     "currentChallenge" : 1
                ]) {
                    (error) in
                    
                    if(error != nil){
                        
                        //Show error Message
                        apiCallBack.onFailure(error: error!)
                    } else {
                        
                        apiCallBack.onSignInSuccess(userUid : (result?.user.uid)!)
                    }
                }
            }
        }
        
    }
}



