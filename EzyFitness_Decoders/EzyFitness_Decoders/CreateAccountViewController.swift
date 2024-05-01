//
//  CreateAccountViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountBtn(_ sender: Any) {
        guard let fullNameText = fullName.text, !fullNameText.isEmpty,
                  let emailText = email.text, !emailText.isEmpty,
                  let contactNumberText = contactNumber.text, !contactNumberText.isEmpty else {
                // If any field is empty, display an error message or handle it appropriately
                print("Please fill in all fields.")
                return
            }

            // At this point, you have all the entered data
            // Perform further actions, such as creating an account or validating the entered information
            
            // Example: Create an account with the entered information
            let accountInfo: [String: String] = ["fullName": fullNameText,
                                                 "email": emailText,
                                                 "contactNumber": contactNumberText]
    }
    

}
