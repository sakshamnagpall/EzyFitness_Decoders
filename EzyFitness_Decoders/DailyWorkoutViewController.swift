//
//  DailyWorkoutViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class DailyWorkoutViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourpicker {
            return hours.count
        } else {
            return minutes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == hourpicker {
            return "\(hours[row])"
        } else {
            return "\(minutes[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == hourpicker {
            selectedHour = hours[row]
        } else {
            selectedMinute = minutes[row]
        }
    }
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var hourpicker: UIPickerView!
    @IBOutlet weak var minutespicker: UIPickerView!
    
    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
    var selectedHour: Int?
    
    let minutes = Array(0...59)
    var selectedMinute: Int?
    
        @IBAction func stepper(_ sender: UIStepper) {
            label.text = Int(sender.value).description
        }
        @IBOutlet weak var label2: UILabel!
        
        @IBAction func stepper2(_ sender: UIStepper) {
            label2.text = Int(sender.value).description
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            hourpicker.delegate = self
            hourpicker.dataSource = self
            
            minutespicker.delegate = self
                    minutespicker.dataSource = self
                    
                    // Set picker view appearance
                    hourpicker.backgroundColor = .black
                    minutespicker.backgroundColor = .black
                    hourpicker.setValue(UIColor.white, forKey: "textColor")
                    minutespicker.setValue(UIColor.white, forKey: "textColor")
        }
    
    @IBAction func submitBtn(_ sender: Any) {
        guard let hour = selectedHour, let minute = selectedMinute else {
                    print("Please select both hour and minute.")
                    return
                }
                
                // Print the selected hour and minute
                print("Selected time: \(hour):\(String(format: "%02d", minute))")
        
//        let valueFromFirstStepper = Int(stepper.value)
//            
//            // Get the value from the second stepper
//            let valueFromSecondStepper = Int(stepper2.value)
//            
//            // Print or use the values as needed
//            print("Value from first stepper: \(valueFromFirstStepper)")
//            print("Value from second stepper: \(valueFromSecondStepper)")
//            
//            // You can also update UI elements with these values if needed
//            label.text = "\(valueFromFirstStepper)"
//            label2.text = "\(valueFromSecondStepper)"
    }
    

}
