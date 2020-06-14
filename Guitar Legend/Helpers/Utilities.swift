//
//  Utilities.swift
//  Guitar Legend
//
//  Created by user167401 on 6/13/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import SCLAlertView


class Utilities {
    
    
    static func createErrorMessage(errorTitle: String, errorMessage : String) {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "Futura-Bold", size: 16)!,
            kTextFont: UIFont(name: "Futura", size: 15)!,
            kButtonFont: UIFont(name: "Futura", size: 15)!,
            showCloseButton: true
        )
        
        SCLAlertView(appearance: appearance).showError(errorTitle.uppercased(), subTitle:errorMessage)
        
    }


}
