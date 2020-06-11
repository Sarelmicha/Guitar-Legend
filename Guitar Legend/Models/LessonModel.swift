//
//  LessonModel.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


class LessonModel {
    
    var chords : [Chord]
    
    init(chords : [Chord]) {
        
        self.chords = chords
    }
    
    func checkSelectedChord(selectedChordName : String)-> Chord? {
        
        for chord in chords {
            
            if(chord.name == selectedChordName ){
                return chord
            }
            
        }
        return nil
    }
}
