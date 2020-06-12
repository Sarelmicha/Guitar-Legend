//
//  ChallengesController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import SCLAlertView

class ChallengesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentUser : User!
    var challengeModel  : ChallengeModel!
    var challenges = [Challenge]()
    var pickedChallenge : Challenge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        challengeModel = ChallengeModel(currentUser: currentUser)
        setCollectionView()
        
        // Call the getChallenges method of the challenge model
        challenges = challengeModel.getChallenges()
        
        headerLabel.text = challengeModel.setInfo(currentChallenge: currentUser.currentChallenge)
        
    }
    
    
    
    @IBAction func onSettingsButtonPressed(_ sender: UIButton) {
        
           self.performSegue(withIdentifier: "goToSettingsPage", sender: self)
    }
    
    func setCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: - UICollectionView Prtocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return challenges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCell", for: indexPath)
            as! ChallengeCollectionViewCell
        
        cell.setChallege(challege: challenges[indexPath.row])
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get the challenge that the user selected
        pickedChallenge = challenges[indexPath.row]
        
        if(pickedChallenge.numOfChallenge <= currentUser.currentChallenge){
                    
            self.performSegue(withIdentifier: "goToLessonPage", sender: self)
            
            
        } else {
            
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "Futura-Bold", size: 16)!,
                kTextFont: UIFont(name: "Futura", size: 15)!,
                kButtonFont: UIFont(name: "Futura", size: 15)!,
                showCloseButton: true
)
            
            SCLAlertView(appearance: appearance).showError("Challenge is locked!".uppercased(), subTitle: "Hey Legend!\n Please take previuse challenges")
        }
        
        
        
    }
    
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToLessonPage"){
            
            let lessonPage = segue.destination as! LessonController
            
            lessonPage.challenge = pickedChallenge
            lessonPage.currentUser = currentUser
             
        } else if (segue.identifier == "goToSettingsPage") {
            
             let settingsPage = segue.destination as! SettingsController
            
            settingsPage.user = currentUser
            
            
        }
        
        
    }
    
    
}
