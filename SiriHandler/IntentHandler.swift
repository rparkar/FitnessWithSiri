//
//  IntentHandler.swift
//  SiriHandler
//
//  Created by Rehan Parkar on 2018-06-11.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INStartWorkoutIntentHandling {
    
    //properties
    
    
    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        
        print("Start work out intent", intent)
        
        let userActivity: NSUserActivity? = nil
        
        guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: userActivity))
            return
        }
        
        if spokenPhrase == "walk" || spokenPhrase == "run" {
            completion(INStartWorkoutIntentResponse(code: .handleInApp, userActivity: userActivity))
        } else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
        }
    }
    
    
}

