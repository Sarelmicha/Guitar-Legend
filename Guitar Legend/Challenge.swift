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
    var songName : String
    var songImage : UIImage
    var songUrl : String
    var isActive : Bool
    
    init(numOfChallenge : Int, chords : [Chord],songName : String,songImage : UIImage,songUrl : String, isActive : Bool) {
        
        self.numOfChallenge = numOfChallenge
        self.chords = chords
        self.songName = songName
        self.songImage = songImage
        self.songUrl = songUrl
        self.isActive = isActive
    }
    
    
}
