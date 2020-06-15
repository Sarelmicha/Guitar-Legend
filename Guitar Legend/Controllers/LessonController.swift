//
//  LessonController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class LessonController: UIViewController, UpdateApiCallBack {
    
    @IBOutlet weak var lessonHeader: UILabel!

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var nextChallengeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var secondChordButton: UIButton!
    @IBOutlet weak var firstChordButton: UIButton!
    @IBOutlet weak var songButton: UIButton!
    @IBOutlet weak var youTubeButton: UIButton!
    
    var challenge : Challenge!
    var lessonModel : LessonModel!
    var selectedChord : Chord!
    var currentUser : User!
    var soundManager : SoundManager!
    var firebaseModel : FirebaseModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
        setInfo()

        
    }
    
    func initValues() {
        
        firebaseModel = FirebaseModel()
        lessonModel = LessonModel(chords: challenge.chords)
        soundManager = SoundManager()
        
        
    }
    
    func setInfo() {
        
        lessonHeader.text = "LESSON \(challenge.numOfChallenge)"
        print(challenge.chords[0].name)
        print(challenge.chords[1].name)
        firstChordButton.setTitle(challenge.chords[0].name, for: .normal)
        secondChordButton.setTitle(challenge.chords[1].name, for: .normal)
        songNameLabel.text = "\(challenge.song.name) by \(challenge.song.singer)"
        
        if(currentUser.currentChallenge == challenge.numOfChallenge){
            nextChallengeButton.isHidden = false
        } else if(currentUser.currentChallenge > challenge.numOfChallenge || challenge.numOfChallenge == Finals.MAX_CHALLENGE){
            nextChallengeButton.isHidden = true
        }
        
    }
    
    
    @IBAction func onYouTubeButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: Finals.YOUTUBE_PAGE, sender: self)
        
    }
    @IBAction func onChordButtonPressed(_ sender: UIButton) {
        
        print(sender.titleLabel!.text!)
        
        selectedChord = lessonModel.checkSelectedChord(selectedChordName: sender.titleLabel!.text!)
        print(selectedChord.name)

        self.performSegue(withIdentifier: Finals.CHORD_PAGE, sender: self)
        
    }
    @IBAction func onSongButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: Finals.SONG_PAGE, sender: self)
        
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
           if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func onNextChallengeButtonPressed(_ sender: UIButton) {
        
        
        firebaseModel.updateChallengeUser(userUid: currentUser.uId, updatedChallenge: currentUser.currentChallenge + 1, apiCallBack: self)
        
    
    }
    
    func onUpdateSuccess() {
        
        
        //Update user localy
        currentUser.currentChallenge += 1
        
        //Make a Rock N Roll Sound!
        soundManager.playSound(soundFile : "next_challenge")
        
        
        self.performSegue(withIdentifier: Finals.CHALLANGES_PAGE, sender: self)
              
          }
          
          func onFailure(error: Error?) {
            Utilities.createErrorMessage(errorTitle: Finals.ERROR, errorMessage: error!.localizedDescription)
          }
    
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Finals.SONG_PAGE){
            
        let songPage = segue.destination as! SongController
            songPage.song = challenge.song
            
        } else if(segue.identifier == Finals.CHORD_PAGE) {
            
            let chordPage = segue.destination as! ChordController
            chordPage.chord = selectedChord
        } else if(segue.identifier == Finals.YOUTUBE_PAGE) {
            
            let youTubePage = segue.destination as! YouTubeController
            youTubePage.videoId = challenge.song.songVideoId
            youTubePage.header = challenge.song.name
            youTubePage.footer = challenge.song.singer
        } else if(segue.identifier == Finals.CHALLANGES_PAGE) {
            
            let challengesPage = segue.destination as! ChallengesController
            challengesPage.currentUser = currentUser
            
        }
    }
}
