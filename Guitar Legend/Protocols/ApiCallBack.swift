//
//  ApiCallbacks.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

protocol ApiCallBack {
    
    func onSuccess(userUid: String)
    
    func onFailure(error: Error)
}
