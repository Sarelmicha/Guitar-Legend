//
//  CRUD.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

protocol CRUD {

    func create(emailText: String,passwordText : String,apiCallBack : ApiCallBack)
    
    func read(userUid: String) -> User?
    
    func update()
    
    func delete()
    
}
