//
//  ChallengeModel.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import UIKit

class ChallengeModel {
    
    var challenges = [Challenge]()
    var currentUser : User = User(uId : 1 , currentChallenge : 18)
    
    init(currentUser : User) {
        self.currentUser = currentUser
    }
    
    func setInfo(currentChallenge : Int) -> String? {
        
        
        if(currentChallenge <= 4) {
            return "NOOBY"
        } else if(currentChallenge <= 8){
            return "BABY STEP GUITARIEST"
        } else if(currentChallenge <= 12){
            return "HALF WAY MAESTRO"
        } else if(currentChallenge <= 16){
            return "BAD ASS PLAYER"
        } else if(currentChallenge < 20){
            return "ROCK N ROLL SPIRIT"
        } else {
            return "YOU ARE LEGEND!"
        }
    }
    
    func getChallenges() -> [Challenge]{
        
        
        
        createChallange(firstChordName: "A", firstChordSound: "A", firstChordImage: #imageLiteral(resourceName: "a-chord"), firstChordVideoId: "VkkOFLouQDs", secondChordName: "E", secondChordSound: "E", secondChordImage: #imageLiteral(resourceName: "e-chord-1"), secondChordVideoId: "8H393ryDkuY", numOfChallenge: 1, songName: "Achy Breaky Heart",singer: " Billy Ray Cyrus", songImage: #imageLiteral(resourceName: "Achy-Breaky-Heart-song"), songUrl: "esZhlB61Uis")
        
        
        
        createChallange(firstChordName: "G", firstChordSound: "G", firstChordImage: #imageLiteral(resourceName: "g-chord.jpg"), firstChordVideoId: "gEzwpqmt2gc", secondChordName: "D", secondChordSound: "D", secondChordImage: #imageLiteral(resourceName: "d-chord.jpg"), secondChordVideoId: "yh6sPqDEZCY", numOfChallenge: 2, songName: "Mr. Tambourine Man",singer: "Bob Dylan", songImage: #imageLiteral(resourceName: "MrTambourine.png"), songUrl: "Ya7zlRKPFdk")
        
        
        createChallange(firstChordName: "C", firstChordSound: "C", firstChordImage: #imageLiteral(resourceName: "c-chord.jpg"), firstChordVideoId: "RBYqdBqogo4", secondChordName: "Am", secondChordSound: "Am", secondChordImage: #imageLiteral(resourceName: "am-chord.jpg"), secondChordVideoId: "kV_EABwevy4", numOfChallenge: 3, songName: "Knockin' On Heaven's Door",singer: "Guns N' Roses", songImage: #imageLiteral(resourceName: "knockingOnHeavnesDoor.png"), songUrl: "MLPdY20CvjQ")
        
        
        createChallange(firstChordName: "Em", firstChordSound: "Em", firstChordImage: #imageLiteral(resourceName: "em-chord.jpg"), firstChordVideoId: "Hfm4-yOI6oA", secondChordName: "Dm", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "dm-chord.jpg"), secondChordVideoId: "EovReq8aAgU", numOfChallenge: 4, songName: "Ain't no sunshine",singer: "Bill Withers", songImage: #imageLiteral(resourceName: "AintNoSunshine.png"), songUrl: "-gwze2B_juE")
        
        
        createChallange(firstChordName: "F", firstChordSound: "F", firstChordImage: #imageLiteral(resourceName: "f-chord.jpg"), firstChordVideoId: "aqH9HNrAveg", secondChordName: "B", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "b-chord.png"), secondChordVideoId: "B6xbJazlViE", numOfChallenge: 5, songName: "Hallelujah",singer: "Leonard Cohen", songImage: #imageLiteral(resourceName: "Hellulja.png"), songUrl: "DZCyaEU0Dnk")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 6, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 7, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 8, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 9, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 10, songName: "BAL BLA",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 11, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 12, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 13, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 14, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 15, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 16, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 17, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 18, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 19, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        createChallange(firstChordName: "C", firstChordSound: "", firstChordImage: #imageLiteral(resourceName: "logo"), firstChordVideoId: "", secondChordName: "G", secondChordSound: "", secondChordImage: #imageLiteral(resourceName: "left-arrow"), secondChordVideoId: "", numOfChallenge: 20, songName: "",singer: "", songImage: #imageLiteral(resourceName: "speaker"), songUrl: "")
        
        
        //Return the array
        
        return challenges
        
    }
    
    
    func createChallange(firstChordName : String, firstChordSound : String, firstChordImage : UIImage, firstChordVideoId : String,secondChordName : String, secondChordSound : String, secondChordImage : UIImage, secondChordVideoId : String, numOfChallenge : Int, songName : String, singer : String, songImage : UIImage, songUrl : String) {
        
        //Create chords for challenge 
        var challengeChords = [Chord]()
        
        //first chord
        challengeChords.append(Chord(name : firstChordName, sound: firstChordSound, chordImage: firstChordImage, chordUrl: firstChordVideoId))
        
        //second chord
        challengeChords.append(Chord(name : secondChordName, sound: secondChordSound, chordImage: secondChordImage, chordUrl: secondChordVideoId))
        
        
        
        challenges.append(Challenge(numOfChallenge: numOfChallenge, chords: challengeChords,
        song: Song(name: songName, singer: singer, image: songImage, songUrl: songUrl), isActive: currentUser.currentChallenge >= numOfChallenge ? true : false))
        
        
    }
    
    
    
    
}


