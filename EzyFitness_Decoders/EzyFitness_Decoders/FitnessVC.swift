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
    
    
    @IBOutlet weak var Picker: UIPickerView!
    
    let goalchoices = ["Daily","Every other day","Weekly","Biweekly"]
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.delegate = self
        Picker.dataSource = self

        // Do any additional setup after loading the view.
    }
    

//    @IBAction func submitFitnessGoal(_ sender: UIButton) {
//        userDataModel.updateUser(id: <#T##UUID#>, weight: <#T##Double#>, height: <#T##Double#>, goal: <#T##Set<FitnessGoal>#>, workoutFrequency: <#T##WorkoutFrequency#>)
//    }
    
}

extension FitnessVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalchoices.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return goalchoices[row]
    }
}

