//
//  SongController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class SongController: UIViewController {
    
    
    @IBOutlet weak var nameOfSongLabel: UILabel!
    @IBOutlet weak var nameOfSingerLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    var song : Song!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nameOfSongLabel.text = song.name
        nameOfSingerLabel.text = song.singer
        songImage.image = song.image
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
    

}
