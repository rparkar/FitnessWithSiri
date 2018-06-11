//
//  FitnessVC.swift
//  HelloSiri
//
//  Created by Rehan Parkar on 2018-06-11.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import Intents

class FitnessVC: UIViewController {

    //outlets
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpView() {
        
        typeLabel.isHidden = true
        timerLabel.isHidden = true
        
        INPreferences.requestSiriAuthorization { (status) in
            
            if status == INSiriAuthorizationStatus.authorized {
                print("Siri authorized")
            } else {
                print("Siri is unauthorized")
            }
        }
    }
    
    
    
    

}

