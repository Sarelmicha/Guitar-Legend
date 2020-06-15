//
//  ChordController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class ChordController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var chordImage: UIImageView!
    @IBOutlet weak var chordLabel: UILabel!
    var chord : Chord!
    var soundManager : SoundManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
        setInfo()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func initValues() {
        
        soundManager = SoundManager()
        
    }
    
    func setInfo() {
        
        chordLabel.text = "\(chord.name) Chord"
        chordImage.image = chord.chordImage
        chordImage.layer.cornerRadius = 2.0
        chordImage.clipsToBounds = true
    }
    
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onYouTubeButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: Finals.YOUTUBE_PAGE, sender: self)
        
    }
    
    @IBAction func onSoundButtonPressed(_ sender: UIButton) {
        
        soundManager.playSound(soundFile: chord.sound)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Finals.YOUTUBE_PAGE){
            
            let youTubePage = segue.destination as! YouTubeController
            youTubePage.videoId = chord.chordVideoId
            
        }
        
    }
    
    
}
