//
//  ApiCallbacks.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

protocol SignInApiCallBack {
    
    func onSignInSuccess(userUid: String)
    
    func onGetUserSuccess(user : User)
    
    func onFailure(error: Error)
}
