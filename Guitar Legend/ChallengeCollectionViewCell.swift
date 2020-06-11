//
//  ChallengeCollectionViewCell.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var challengeButton: UIButton!
    
    
    var challenge : Challenge?
    
    func setChallege(challege : Challenge) {
        
        challengeButton.setTitle(String(challege.numOfChallenge), for: .normal)
        challengeButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        challengeButton.layer.cornerRadius = 0.5 * challengeButton.bounds.size.width
        challengeButton.clipsToBounds = true
        challengeButton.backgroundColor = UIColor.clear
        challengeButton.layer.borderWidth = 4.0
        
       
        
        
        if(challege.isActive){
            challengeButton.setTitleColor(UIColor(red: 0, green: 250, blue: 255, alpha: 255), for: .normal)
            challengeButton.layer.borderColor = UIColor(red: 0, green: 250, blue: 255, alpha: 255).cgColor
        } else {
            challengeButton.setTitleColor(UIColor(red: 186, green: 208, blue: 208, alpha: 255), for: .normal)
            challengeButton.layer.borderColor = UIColor(red: 186, green: 208, blue: 208, alpha: 255).cgColor
        }
    }
}
