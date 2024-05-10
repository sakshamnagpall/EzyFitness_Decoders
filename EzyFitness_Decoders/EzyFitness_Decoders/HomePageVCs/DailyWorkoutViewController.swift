import UIKit

class DailyWorkoutViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var planpicker: UIPickerView!
    
    
    let workoutPlans = ["Cardio", "Strength Training", "Yoga", "Pilates", "Crossfit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planpicker.dataSource = self
        planpicker.delegate = self
        
        planpicker.backgroundColor = .black
        

        planpicker.setValue(UIColor.white, forKey: "textColor")
        
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return workoutPlans.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return workoutPlans[row]
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedPlan = workoutPlans[row]
        print("Selected workout plan: \(selectedPlan)")
    }
    
    // MARK: - Actions
    
    
}
