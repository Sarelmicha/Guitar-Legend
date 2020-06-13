//
//  YouTubeController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class YouTubeController: UIViewController, YTPlayerViewDelegate{
    
    @IBOutlet var playerView : YTPlayerView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var songNameLabel: UIView!
    var videoId : String!
    
    @IBOutlet var singerNameLabel: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        playerView.load(withVideoId: videoId, playerVars: ["playsinline" : 1])
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSigupButtonPressed(_ sender: UIButton) {
        
        
    }
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
    
}
