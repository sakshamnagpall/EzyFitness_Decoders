//
//  HomeViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 26/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var BMI: UILabel!
    
    @IBOutlet weak var calBurned: UILabel!
    
    
    @IBOutlet weak var steps: UILabel!
    
    @IBOutlet weak var timeInvested: UILabel!
    
    var passedUser : User?
    
    var todayActivities : TodayActivities?
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.hidesBackButton = true
            
            // Debug print to check if passedUser is not nil
            if let user = passedUser {
                print("Passed User: \(user)")
            } else {
                print("Passed User is nil")
            }
            
            // Debug print to check if todayActivities is not nil
            if let activities = todayActivities {
                print("Today Activities: \(activities)")
            } else {
                print("Today Activities is nil")
            }
            
            // Update labels with todayActivities data
        if let activities = todayActivities, let user = passedUser {
            UserName.text = "Welcome \(user.username)"
            if let bmi = user.bmi {
                BMI.text = "\(bmi)"
            } else {
                BMI.text = "N/A"
            }
            calBurned.text = "\(activities.caloriesBurned)"
            steps.text = "\(activities.stepsCount)"
            timeInvested.text = "\(activities.appUsageTimeInMinutes) min"
        }

        }
}

