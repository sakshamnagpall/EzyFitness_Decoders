//
//  Exercise_8_ViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 30/04/24.
//

import UIKit

class Exercise_8_ViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifView.isHidden = true
    }
    
    @IBAction func addGif(_ sender: Any) {
        gifView.isHidden = false
    }
}
