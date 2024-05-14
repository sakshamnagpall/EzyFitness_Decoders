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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @IBAction func LogInBtn(_ sender: Any) {
        
        guard let contactNumberText = contactNumber.text,
                      !contactNumberText.isEmpty,
                      contactNumberText.count == 10,
                      contactNumberText.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
                    let alertController = UIAlertController(title: "Error", message: "Please enter a valid 10-digit phone number.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                    return
                }
                
                // Create an instance of OTPViewController
                if let otpViewController = storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
                    // Assign the contactNumberText to phoneNumber property of OTPViewController
                    otpViewController.phoneNumber = contactNumberText
                    // Present the OTPViewController
                    navigationController?.pushViewController(otpViewController, animated: true)
                }
            }
    
        }



