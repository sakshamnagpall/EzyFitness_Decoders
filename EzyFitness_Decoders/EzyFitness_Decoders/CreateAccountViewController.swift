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
               // If any field is empty, display an error message
               let alertController = UIAlertController(title: "Error", message: "Please fill in all fields.", preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alertController, animated: true, completion: nil)
               return
           }
    }
    

}
