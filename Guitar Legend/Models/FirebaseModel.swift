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
    
    
    
    func getUser(userUid: String, apiCallBack : ApiCallBack ){
        
        print("LALALALAL")
        
        print("id is \(userUid)")
        
        
        let db = Firestore.firestore()
        
        // Get data
        let docRef = db.collection("users").document(userUid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                apiCallBack.onReadSuccess(user: User.toUser(json: docData!))
                 
                // Do something with doc data
            } else {
                print("Document does not exist")
                
            }
        }
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
                
                db.collection("users").document(result!.user.uid).setData(
                    ["uId" : result!.user.uid,
                     "currentChallenge" : 5
                ]) {
                    (error) in
                    
                    if(error != nil){
                        
                        //Show error Message
                        apiCallBack.onFailure(error: error!)
                    } else {
                        
                        apiCallBack.onCreateSuccess(userUid : (result?.user.uid)!)
                    }
                }
            }
        }
        
    }
}



