import UIKit
protocol PlanSectionDelegate: AnyObject {
    func didSelectPlan(_ planName: String)
}
class DailyWorkoutViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, PlanSectionDelegate, PlanViewControllerDelegate {
    func didCreateNewPlan(_ plan: Plan) {
        
    }
    
    @IBOutlet weak var planpicker: UIPickerView!
    
    
        // Inside didSelectPlan method:
    func presentPlanSectionViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let planSectionViewController = storyboard.instantiateViewController(withIdentifier: "PlanSectionViewController") as? PlanSectionViewController {
                planSectionViewController.delegate = self // Set the delegate
                navigationController?.pushViewController(planSectionViewController, animated: true)
            }
        }

        
    var workoutPlans: [String] = [] // Initialize workoutPlans as an empty array
    
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
    
    // MARK: - PlanSectionDelegate
    
    func didSelectPlan(_ planName: String) {
        // Check if the selected planName already exists in workoutPlans
        if !workoutPlans.contains(planName) {
            // Append the selected plan name to workoutPlans
            workoutPlans.append(planName)
            
            // Reload the picker view to reflect the changes
            planpicker.reloadAllComponents()
        }
    }
}
