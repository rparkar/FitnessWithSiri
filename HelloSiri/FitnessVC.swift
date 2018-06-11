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
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name("workoutStartedNotification"), object: nil)
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
    
    @objc func handleSiriRequest() {
        
        guard let intent = DataService.instance.workoutIntent, let goalValue = intent.goalValue, let workoutType = intent.workoutName?.spokenPhrase else {
            timerLabel.isHidden = true
            typeLabel.isHidden = true
            return
        }
        
        typeLabel.isHidden = false
        timerLabel.isHidden = false
        
        typeLabel.text = "Type: \(workoutType.capitalized)"
        timerLabel.text = "\(goalValue) left "
        
    }
    
    
    

}

