//
//  ChallengeModel.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

class ChallengeModel {
    
    
    
    func getChallenges() -> [Challenge]{
        
        //TODO - in future fecth the right current challenge of user and set it here
        let currentChallengeOfUser  : Int = 1
        
        //Declare an array to store the challenges
        var challenges = [Challenge]()
        
        //Create chords for challenge 1
        var challengeOneChords = [Chord]()
        
        //C chord
        challengeOneChords.append(Chord(name : "C", sound: "", chordImage: #imageLiteral(resourceName: "settings"), chordUrl: ""))

        //G chord
        challengeOneChords.append(Chord(name : "G", sound: "", chordImage: #imageLiteral(resourceName: "music-file"), chordUrl: ""))
        
        
        challenges.append(Challenge(numOfChallenge: 1, chords: challengeOneChords, songName: "", songImage: #imageLiteral(resourceName: "left-arrow"), songUrl: "", isActive: currentChallengeOfUser >= 1 ? true : false))
        
        //Create chords for challenge 2
        let challengeTwoChords = [Chord]()
        
        //C chord
        challengeOneChords.append(Chord(name : "AM", sound: "", chordImage: #imageLiteral(resourceName: "settings"), chordUrl: ""))

        //G chord
        challengeOneChords.append(Chord(name : "F", sound: "", chordImage: #imageLiteral(resourceName: "music-file"), chordUrl: ""))
        
        
        challenges.append(Challenge(numOfChallenge: 2, chords: challengeTwoChords, songName: "", songImage: #imageLiteral(resourceName: "left-arrow"), songUrl: "",isActive: currentChallengeOfUser >= 2 ? true : false))
        
        
        //Return the array
        
        return challenges
        
    }
    
    
    
    
}


