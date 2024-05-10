//
//  FitnessViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 06/05/24.
//

import UIKit

class FitnessViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choice.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choice[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedData = choice[row]
    }
  
    var goals = ["/"]

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var BeHealthier: UIButton!
    
    @IBOutlet weak var BurnCalories: UIButton!
    
    @IBOutlet weak var BuildMuscle: UIButton!
    
    @IBOutlet weak var HeightinFeets: UITextField!
    @IBOutlet weak var HeightinInches: UITextField!
   
    @IBOutlet weak var Weight: UITextField!
    
    
             
    
    @IBAction func CheckBoxBeHealthier(_ sender: UIButton) {
        
        let element = "Be Healthier"
        if let index = goals.firstIndex(of: element) { // Check if element is present
            // If present, remove it
            goals.remove(at: index)
            print("\(element) removed from array")
        } else {
            // If not present, add it
            goals.append(element)
            
            print("\(element) added to array")
        }
        
    }
    
    @IBAction func CheckboxBurnCalories(_ sender: Any) {
        let element = "Burn Calories"
        if let index = goals.firstIndex(of: element) { // Check if element is present
               // If present, remove it
               goals.remove(at: index)
               print("\(element) removed from array")
           } else {
               // If not present, add it
               goals.append(element)
               print("\(element) added to array")
           }
    }
    
    @IBAction func CheckBoxBuildMuscle(_ sender: Any) {
        let element = "Build Muscles"
        if let index = goals.firstIndex(of: element) { // Check if element is present
               // If present, remove it
               goals.remove(at: index)
               print("\(element) removed from array")
           } else {
               // If not present, add it
               goals.append(element)
               print("\(element) added to array")
           }
        
    }
    
    
    let choice = ["Daily","Every other day","Bi-Weekly","Weekly"]
    var selectedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BeHealthier.layer.cornerRadius = BeHealthier.bounds.width / 2
                BeHealthier.layer.borderWidth = 2
                BeHealthier.layer.borderColor = UIColor.orange.cgColor
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.backgroundColor = UIColor.black
        picker.setValue(UIColor.white, forKey: "textColor")

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButton(_ sender: Any) {
        if let selectedData = selectedData {
                   print("Selected data: \(selectedData)")
               } else {
                   print("No data selected.")
               }
        if let heightFeetText = HeightinFeets.text, let heightFeet = Double(heightFeetText),
                   let heightInchesText = HeightinInches.text, let heightInches = Double(heightInchesText),
                   let weightText = Weight.text, let weight = Double(weightText) {
                    // Convert height to meters and weight to kilograms
                    let heightInMeters = ((heightFeet * 12) + heightInches) * 0.0254
                    let weightInKg = weight * 0.453592
                    
                    let bmi = calculateBMI(weightInKg: weightInKg, heightInM: heightInMeters)
                    print("BMI: \(bmi)")
                } else {
                    print("Please enter valid height in feet and inches, and weight in pounds.")
                }
        
            }
            
            func calculateBMI(weightInKg: Double, heightInM: Double) -> Double {
                return weightInKg / (heightInM * heightInM)
            
    }
}

