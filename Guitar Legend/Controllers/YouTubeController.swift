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
    
    @IBOutlet weak var nameOfSongLabel: UILabel!
    @IBOutlet weak var nameOfSingerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var songNameLabel: UIView!
    var videoId : String!
    var header : String!
    var footer : String!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initValues()
        setInfo()
        
    }
    
    func setInfo() {
        
        nameOfSongLabel.text = header
        nameOfSingerLabel.text = footer
        
    }
    
    func initValues() {
        
        playerView.delegate = self
        playerView.load(withVideoId: videoId, playerVars: ["playsinline" : 1])
        
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
