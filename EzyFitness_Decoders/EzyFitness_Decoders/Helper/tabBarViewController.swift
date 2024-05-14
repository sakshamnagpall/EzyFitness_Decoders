//
//  tabBarViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 11/05/24.
//

import UIKit

class tabBarViewController: UITabBarController {
    

    var passedUser: User?
    
    var todayActivities: TodayActivities?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        if let user = passedUser {
                    // Use the user data here as needed
                    print("Received user: \(user)")
                }
        
        if let user = passedUser {
                    todayActivities = TodayActivities(user: user, workoutCount: 7, caloriesBurned: 789, stepsCount: 12345, appUsageTimeInMinutes: 67)
                } else {
                    // Handle the case when passedUser is nil
                    print("Error: passedUser is nil")
                    return
                }
        if let homeViewController = viewControllers?.first as? HomeViewController {
                    homeViewController.passedUser = passedUser
                    homeViewController.todayActivities = todayActivities
                }
        if let profileViewController = viewControllers?[3] as? ProfileViewController {
            profileViewController.passedUser = passedUser
                }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let homeVC = segue.destination as? HomeViewController {
//                homeVC.passedUser = passedUser
//                homeVC.todayActivities = todayActivities
//            }
//        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
