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


class FirebaseModel : CRUD {
    
   
    
    func create(emailText: String, passwordText: String, apiCallBack: ApiCallBack) {
        signUp(emailText: emailText, passwordText : passwordText, apiCallBack : apiCallBack)
    }
    
    func read(userUid: String) -> User? {
           
        let user = getUser(userUid : userUid)
        
        return user
    }

    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    func getUser(userUid: String ) -> User?{
        
        return nil
        
    }
    
    

    func signUp(emailText : String, passwordText :String,apiCallBack : ApiCallBack) {
        
        
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
                
                db.collection("users").addDocument(data: ["uId" : result!.user.uid,"currentChallenge" : 1]) {
                    (error) in
                    
                    if(error != nil){
                        
                        //Show error Message
                         apiCallBack.onFailure(error: error!)
                    } else {
                        
                        apiCallBack.onSuccess(userUid : (result?.user.uid)!)
                    }
                }
            }
        }
    }
}
