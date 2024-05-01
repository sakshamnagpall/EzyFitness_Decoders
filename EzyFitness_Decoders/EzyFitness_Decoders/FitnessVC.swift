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
    
    
    @IBOutlet weak var inches: UITextField!
    @IBOutlet weak var feet: UITextField!
    @IBOutlet weak var Picker: UIPickerView!
    
    @IBOutlet weak var kgs: UITextField!
    let goalchoices = ["Daily","Every other day","Weekly","Biweekly"]
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.delegate = self
        Picker.dataSource = self
        
        Picker.backgroundColor = UIColor.black
        Picker.setValue(UIColor.white, forKey: "textColor")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitFitnessGoal(_ sender: UIButton) {
        
        guard let inchesText = inches.text, !inchesText.isEmpty,
                     let feetText = feet.text, !feetText.isEmpty,
                     let kgsText = kgs.text, !kgsText.isEmpty,
                     let kgsValue = Double(kgsText) else {
               print("Please fill in all fields with valid values.")
               return
           }

           // Concatenate feet and inches as a single string
           let height = "\(feetText)'\(inchesText)''"

           // Get the selected workout frequency from the picker view
           guard let selectedWorkoutFrequency = getSelectedWorkoutFrequency(from: Picker) else {
               print("Please select a workout frequency.")
               return
           }

           // Call updateUser function with retrieved values and selected workout frequency
           userDataModel.updateUser(id: UUID(), weight: kgsValue, height: height, goal: Set<FitnessGoal>(), workoutFrequency: selectedWorkoutFrequency)

    }
    
    
    func getSelectedWorkoutFrequency(from pickerView: UIPickerView) -> WorkoutFrequency? {
        let selectedRow = pickerView.selectedRow(inComponent: 0)

        // Assuming you have defined WorkoutFrequency enum
        enum WorkoutFrequency {
            case daily, weekly, biWeekly // Adjusted the case names to match your UIPickerView data
        }

        switch selectedRow {
        case 0:
            return .daily
        case 1:
            return .weekly
        case 2:
            return .biWeekly
        default:
            return nil
        }
    }
    
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

