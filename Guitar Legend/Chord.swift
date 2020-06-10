//
//  Chord.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import UIKit


class Chord {
    
    var name : String
    var sound : String
    var chordImage : UIImage
    var chordUrl : String
    
    init(name : String,sound : String, chordImage : UIImage, chordUrl : String) {
        
        self.name = name
        self.sound = sound
        self.chordImage = chordImage
        self.chordUrl = chordUrl
    }
    
    
}
