//
//  DailyChallengeApiCallBack.swift
//  Guitar Legend
//
//  Created by user167401 on 6/15/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


protocol DailyChallengeApiCallBack {
    
    func onGetDailyChallengeSuccess(song : Song)
    
    func onFailure(error: Error?)
}
