//
//  FitnessVC.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class FitnessVC: UIViewController {
    @IBOutlet weak var BeHealthier: UIButton!
    @IBOutlet weak var BurnCalories: UIButton!
    @IBOutlet weak var BuildMuscle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func submitFitnessGoal(_ sender: UIButton) {
        userDataModel.updateUser(id: <#T##UUID#>, weight: <#T##Double#>, height: <#T##Double#>, goal: <#T##Set<FitnessGoal>#>, workoutFrequency: <#T##WorkoutFrequency#>)
    }
    
}
