//
//  ApiCallbacks.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

protocol ApiCallBack {
    
    func onCreateSuccess(userUid: String)
    
    func onReadSuccess(user : User)
    
    func onFailure(error: Error)
}
