//
//  Challenge.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import UIKit

class Challenge {

    
    var numOfChallenge : Int
    var chords : [Chord]
    var song : Song
    var isActive : Bool
    
    init(numOfChallenge : Int, chords : [Chord],song : Song, isActive : Bool) {
        
        self.numOfChallenge = numOfChallenge
        self.chords = chords
        self.song  = song
        self.isActive = isActive
    }
}
