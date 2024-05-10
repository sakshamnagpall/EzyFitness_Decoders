import UIKit

class MorningYoga_ViewController: UIViewController {
    
    @IBOutlet weak var hours: UIPickerView!
    @IBOutlet weak var minutes: UIPickerView!
    @IBOutlet weak var stepperL1: UILabel!
    @IBOutlet weak var stepperL2: UILabel!
    
    
    @IBAction func stepper1(_ sender: UIStepper) {
        stepperL1.text = Int(sender.value).description
        
    }
    
    @IBAction func stepper2(_ sender: UIStepper) {
        stepperL2.text = Int(sender.value).description
        
    }
    
    
}
