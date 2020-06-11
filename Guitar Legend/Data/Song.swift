//
//  Song.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import UIKit

class Song {
    
    var name : String
    var singer : String
    var image : UIImage
    var songUrl : String
    
    init(name : String ,singer : String ,image : UIImage,songUrl : String) {
        
        self.name = name
        self.singer = singer
        self.image = image
        self.songUrl = songUrl
    }
    
    
}
