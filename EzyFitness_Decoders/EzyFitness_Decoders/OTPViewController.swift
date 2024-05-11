//
//  OTPViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 11/05/24.
//

import UIKit

class OTPViewController: UIViewController {
    var phoneNumber : String?

    @IBOutlet weak var contactnum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let phoneNumber = phoneNumber {
                    contactnum.text = phoneNumber
                }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
