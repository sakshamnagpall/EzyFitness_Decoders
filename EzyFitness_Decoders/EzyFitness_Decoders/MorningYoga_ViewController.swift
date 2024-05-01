//
//  MorningYoga_ViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 25/04/24.
//

import UIKit

class MorningYoga_ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
        
        @IBOutlet weak var label2: UILabel!
        
        @IBAction func stepper(_ sender: UIStepper) {
            label.text = Int(sender.value).description
        }
        @IBAction func stepper2(_ sender: UIStepper) {
            label2.text = Int(sender.value).description
        }
    
    
    
    @IBOutlet weak var setDuration: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "HH:mm:ss"
        
        // Set initial text for setDuration text field with current time
        setDuration.text = formatter.string(from: Date()) // Use Date() to get current date and time
        setDuration.textColor = .black
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: .valueChanged)
        
        // Set the input view of setDuration text field to timePicker
        setDuration.inputView = timePicker
    }

    @objc func timePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "HH:mm:ss"
        setDuration.text = formatter.string(from: sender.date)
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
    }
    

   
}
