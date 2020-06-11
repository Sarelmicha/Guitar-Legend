//
//  LessonController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class LessonController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lessonModel = LessonModel(chords: challenge.chords)
        
        lessonHeader.text = "LESSON \(challenge.numOfChallenge)"
        firstChordButton.titleLabel?.text = challenge.chords[0].name
        secondChordButton.titleLabel?.text = challenge.chords[1].name
        songNameLabel.text = challenge.song.name

        
    }
    
    
    @IBAction func onYouTubeButtonPressed(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "goToYouTubePage", sender: self)
        
    }
    @IBAction func onChordButtonPressed(_ sender: UIButton) {
        
        selectedChord = lessonModel.checkSelectedChord(selectedChordName: sender.titleLabel!.text!)

        self.performSegue(withIdentifier: "goToChordPage", sender: self)
        
    }
    @IBAction func onSongButtonPressed(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "goToSongPage", sender: self)
        
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
           if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func onNextChallengeButtonPressed(_ sender: UIButton) {
        
        currentUser.currentChallenge += 1
        
        //Make a Rock N Roll Sound!
        
//        onBackButtonPressed(sender)
        
        self.performSegue(withIdentifier: "goToChallengesPage", sender: self)

    }
    
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if(segue.identifier == "goToSongPage"){
            
        let songPage = segue.destination as! SongController
            songPage.song = challenge.song
            
         } else if(segue.identifier == "goToChordPage") {
            
            let chordPage = segue.destination as! ChordController
            chordPage.chord = selectedChord
         } else if(segue.identifier == "goToYouTubePage") {
            
            let youTubePage = segue.destination as! YouTubeController
            youTubePage.videoId = challenge.song.songVideoId
        } else if(segue.identifier == "goToChallengesPage") {
            
            let challengesPage = segue.destination as! ChallengesController
            challengesPage.currentUser = currentUser
            
        }
    }
}
