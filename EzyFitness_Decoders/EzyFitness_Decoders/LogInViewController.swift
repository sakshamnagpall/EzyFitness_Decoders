//
//  LogInViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var contactNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func LogInBtn(_ sender: Any) {
        guard let contactNumberText = contactNumber.text, !contactNumberText.isEmpty else {
               // If the text field is empty, display an error message or handle it appropriately
               print("Please enter a contact number.")
               return
           }

           // Print the entered contact number to the console
           print("Entered contact number:", contactNumberText)
    }
}
