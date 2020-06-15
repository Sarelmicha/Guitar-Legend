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
    var songVideoId : String
    
    init(name : String ,singer : String ,image : UIImage,songUrl : String) {
        
        self.name = name
        self.singer = singer
        self.image = image
        self.songVideoId = songUrl
    }
    
    static func toSong(json: [String : Any]) ->Song {
        
        return Song(name: json["name"] as! String, singer: json["singer"] as! String, image: #imageLiteral(resourceName: "music-file"),songUrl: json["songVideoId"] as! String)
    }
    
    
}
