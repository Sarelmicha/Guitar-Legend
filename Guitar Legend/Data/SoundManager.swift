//
//  SoundManager.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer : AVAudioPlayer!
    
    
    func playSound(soundFile : String) {
        
        let pathToSound = Bundle.main.path(forResource: soundFile, ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play();
        } catch {
            //Error handling.
            print("Couldn't find sound file...")
        }
    }
    
    
    
}
