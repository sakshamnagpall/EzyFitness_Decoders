//
//  activity_vc.swift
//  EzyFitness_Decoders
//
//  Created by student on 07/05/24.
//

import UIKit

import UIKit

class activity_vc: UIViewController {

    let first = Activity_H_ViewController()
    let second = Achievement()
    
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.barTintColor = UIColor.black
        container1?.alpha = 1
        container2?.alpha = 0
        
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    @IBAction func showComponent(_ sender: Any) {
            if (sender as AnyObject).selectedSegmentIndex == 0 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.container1.alpha = 1
                    self.container2.alpha = 0
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.container1.alpha = 0
                    self.container2.alpha = 1
                })
            }
        }
    }
   
    
    



//class activity_vc: UIViewController {
//
//    let first = Activity_H_ViewController()
//    let second = Achievement()
//    
//    @IBOutlet weak var container1: UIView!
//    @IBOutlet weak var container2: UIView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Add the views of first and second view controllers as subviews
//        container1.addSubview(first.view)
//        container2.addSubview(second.view)
//        
//        // Set initial alpha values
//        container1.alpha = 1
//        container2.alpha = 0
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    @IBAction func showComponent(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            UIView.animate(withDuration: 0.5) {
//                self.container1.alpha = 1
//                self.container2.alpha = 0
//            }
//        } else {
//            UIView.animate(withDuration: 0.5) {
//                self.container1.alpha = 0
//                self.container2.alpha = 1
//            }
//        }
//    }
//}

