//
//  tabBarControllerViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 10/05/24.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for viewController in viewControllers ?? [] {
                  // Check if the child view controller is a UINavigationController
                  if let navController = viewController as? UINavigationController {
                      // Hide the back button for each view controller in the navigation stack
                      navController.topViewController?.navigationItem.hidesBackButton = true
                  }
              }
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
