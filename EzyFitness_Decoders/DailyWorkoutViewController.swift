//
//  DailyWorkoutViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class DailyWorkoutViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
        
        @IBAction func stepper(_ sender: UIStepper) {
            label.text = Int(sender.value).description
        }
        @IBOutlet weak var label2: UILabel!
        
        @IBAction func stepper2(_ sender: UIStepper) {
            label2.text = Int(sender.value).description
        }
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    


}
