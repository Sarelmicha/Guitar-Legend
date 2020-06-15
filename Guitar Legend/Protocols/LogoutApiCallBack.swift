//
//  LogoutApiCallBack.swift
//  Guitar Legend
//
//  Created by user167401 on 6/14/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


protocol LogoutApiCallBack {
    
    //Logout Callbacks
    
    func onLogoutSuccess()
    
    func onFailure(error: Error?)
}
