//
//  ChallengesController.swift
//  Guitar Legend
//
//  Created by user167401 on 6/10/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class ChallengesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentUser : User!
    var challengeModel  : ChallengeModel!
    var challenges = [Challenge]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengeModel = ChallengeModel(currentUser: currentUser)
        setCollectionView()
        
        // Call the getChallenges method of the challenge model
        challenges = challengeModel.getChallenges()
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
        
        // Get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! ChallengeCollectionViewCell
        
        // Geth the challenge that the user selected
        let challenge = challenges[indexPath.row]
        
        if(challenge.numOfChallenge <= currentUser.currentChallenge){
            //Navigate to the challenge
            
        } else {
            //TODO - Pop up error message
        }
        
        
        
    }
    

    
     //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
    }
    

}
