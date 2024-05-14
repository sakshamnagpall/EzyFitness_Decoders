
import UIKit
protocol PlanViewControllerDelegate: AnyObject {
    func didCreateNewPlan(_ plan: Plan)
}
protocol PlanNameDelegate: AnyObject {
    func didCreateNewPlanName(_ planName: String)
}

class PlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var onNewPlanCreated: ((Plan) -> Void)?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Filter the exercises dictionary to get only the selected exercises and return the count
        return selectedExercises.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
                
                // Get the exercise name at the current index
                let exerciseName = selectedExercises[indexPath.row]
                
                // Configure the cell
                cell.textLabel?.text = exerciseName
                cell.accessoryType = .checkmark
                
                return cell
    }

    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourpicker {
            return hours.count
        } else {
            return minutes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == hourpicker {
            return "\(hours[row])"
        } else {
            return "\(minutes[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == hourpicker {
            selectedHour = hours[row]
        } else {
            selectedMinute = minutes[row]
        }
    }
    
    @IBOutlet weak var planname: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hourpicker: UIPickerView!
    @IBOutlet weak var minutespicker: UIPickerView!
    
    var plan: Plan?
    var selectedExercises: [String] = []
    
    weak var delegate: PlanViewControllerDelegate?
    
    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
    var selectedHour: Int?
    
    let minutes = Array(0...59)
    var selectedMinute: Int?
    
    var exercises: [String] = []
    
    var plans: [Plan] = []
    
    // Define a string array to store plan names
    var planNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Received exercises:", selectedExercises)
        
        hourpicker.delegate = self
        hourpicker.dataSource = self
        
        minutespicker.delegate = self
        minutespicker.dataSource = self
        
        hourpicker.backgroundColor = .black
        minutespicker.backgroundColor = .black
        
        hourpicker.setValue(UIColor.white, forKey: "textColor")
        minutespicker.setValue(UIColor.white, forKey: "textColor")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
                

        
        // Set the appearance mode of the table view to dark
        if #available(iOS 13.0, *) {
            tableView.overrideUserInterfaceStyle = .dark
        }
        
        // Initialize exercises here after `self` is available
        exercises = selectedExercises
    }
    
    // Other methods...
    @IBAction func addButton(_ sender: Any) {
        guard let planName = planname.text, !planName.isEmpty else {
            print("Please enter a plan name.")
            return
        }
        
        guard let hour = selectedHour, let minute = selectedMinute else {
            print("Please select both hour and minute.")
            return
        }
        
        let duration = Duration(hours: hour, minutes: minute)
        
        let newPlan = Plan(name: planName, duration: duration, exercises: selectedExercises)
        
        print("Selected time: \(hour):\(String(format: "%02d", minute))")
        print("New Plan Name: \(newPlan.name)")
        
        print("New plan created: \(newPlan)")
        plans.append(newPlan) // Append the newPlan instead of plan
        planNames.append(newPlan.name) // Append the plan name to planNames array
        print("New plan added: \(String(describing: newPlan))")
        print("Total plans count: \(plans.count)")
        print("Received Plan:", newPlan)
        print("Plan names array: \(planNames)")
        
        delegate?.didCreateNewPlan(newPlan)
        
            presentingViewController?.presentingViewController?.dismiss(animated: true) {
                if let navigationController = self.navigationController {
                    navigationController.popToRootViewController(animated: true)
                    print("All modally presented view controllers dismissed")
                }
            }
//        navigationController?.dismiss(animated: true) {
//            print("PlanViewController dismissed")
            
                print("Navigating to PlanSectionViewController")
            }
        }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //import UIKit
    //protocol PlanViewControllerDelegate: AnyObject {
    //    func didCreateNewPlan(_ plan: Plan)
    //}
    //
    //
    //class PlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    //
    //    var onNewPlanCreated: ((Plan) -> Void)?
    //
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // Filter the exercises dictionary to get only the selected exercises and return the count
    //        return exercises.filter { $0.value }.count
    //    }
    //
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
    //
    //        // Get the selected exercises
    //        let selectedExercises = exercises.filter { $0.value }
    //
    //        // Get the exercise name at the current index
    //        let exerciseName = Array(selectedExercises.keys)[indexPath.row]
    //
    //        // Configure the cell
    //        cell.textLabel?.text = exerciseName
    //        cell.accessoryType = .checkmark
    //
    //        return cell
    //    }
    //
    //
    //
    //
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        if pickerView == hourpicker {
    //            return hours.count
    //        } else {
    //            return minutes.count
    //        }
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        if pickerView == hourpicker {
    //            return "\(hours[row])"
    //        } else {
    //            return "\(minutes[row])"
    //        }
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        if pickerView == hourpicker {
    //            selectedHour = hours[row]
    //        } else {
    //            selectedMinute = minutes[row]
    //        }
    //    }
    //
    //    @IBOutlet weak var planname: UITextField!
    //    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var hourpicker: UIPickerView!
    //    @IBOutlet weak var minutespicker: UIPickerView!
    //
    //    var plan: Plan?
    //    var selectedExercises: [String: Bool] = [:]
    //
    //    weak var delegate: PlanViewControllerDelegate?
    //
    //    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
    //    var selectedHour: Int?
    //
    //    let minutes = Array(0...59)
    //    var selectedMinute: Int?
    //
    //    var exercises: [String: Bool] = [:]
    //
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        print("Received exercises:", selectedExercises)
    //
    //        hourpicker.delegate = self
    //        hourpicker.dataSource = self
    //
    //        minutespicker.delegate = self
    //        minutespicker.dataSource = self
    //
    //        hourpicker.backgroundColor = .black
    //        minutespicker.backgroundColor = .black
    //
    //        hourpicker.setValue(UIColor.white, forKey: "textColor")
    //        minutespicker.setValue(UIColor.white, forKey: "textColor")
    //
    //        tableView.delegate = self
    //        tableView.dataSource = self
    //        tableView.backgroundColor = .black
    //
    //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    //
    //
    //
    //        // Set the appearance mode of the table view to dark
    //        if #available(iOS 13.0, *) {
    //            tableView.overrideUserInterfaceStyle = .dark
    //        }
    //
    //        // Initialize exercises here after `self` is available
    //        exercises = selectedExercises
    //    }
    //
    //    // Other methods...
    //
    //    @IBAction func addButton(_ sender: Any) {
    //
    //
    //        guard let planName = planname.text, !planName.isEmpty else {
    //            print("Please enter a plan name.")
    //            return
    //        }
    //
    //        guard let hour = selectedHour, let minute = selectedMinute else {
    //            print("Please select both hour and minute.")
    //            return
    //        }
    //
    //        let duration = Duration(hours: hour, minutes: minute)
    //
    //        let newPlan = Plan(name: planName, duration: duration, exercises: selectedExercises)
    //
    //        print("Selected time: \(hour):\(String(format: "%02d", minute))")
    //        print("New Plan Name: \(newPlan.name)")
    //
    //        onNewPlanCreated?(newPlan)
    //        delegate?.didCreateNewPlan(newPlan)
    //
    ////        if let tabBarController = self.tabBarController {
    ////            tabBarController.selectedIndex = 3 // Assuming the target tab index is 1
    ////            print("Switched to tab at index 1")
    ////        } else {
    ////            print("Error: Could not access tab bar controller")
    ////        }
    //
    //        navigationController?.dismiss(animated: true) {
    //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //            if let planSelectionVC = storyboard.instantiateViewController(withIdentifier: "PlanSectionViewController") as? PlanSectionViewController{
    //                self.navigationController?.pushViewController(planSelectionVC, animated: true)
    //            }
    //        }
    //    }
    //}
    
    
    
    
//    @IBAction func addButton(_ sender: Any) {
//        
//        
//        guard let planName = planname.text, !planName.isEmpty else {
//            print("Please enter a plan name.")
//            return
//        }
//        
//        guard let hour = selectedHour, let minute = selectedMinute else {
//            print("Please select both hour and minute.")
//            return
//        }
//        
//        let duration = Duration(hours: hour, minutes: minute)
//        
//        let newPlan = Plan(name: planName, duration: duration, exercises: selectedExercises)
//        
//        print("Selected time: \(hour):\(String(format: "%02d", minute))")
//        print("New Plan Name: \(newPlan.name)")
//        
//        print("New plan created: \(newPlan)")
//        plans.append(plan ?? Plan(name: "No Plan", duration: Duration(hours: 0, minutes: 0), exercises: []))
//        planNames.append(plan?.name ?? "No Plan") // Append the plan name to planNames array
//        print("New plan added: \(String(describing: plan))")
//            print("Total plans count: \(plans.count)")
//        print("Received Plan:", plan ?? Plan(name: "Default Plan Name", duration: Duration(hours: 0, minutes: 0), exercises: []))
//            print("Plan names array: \(planNames)")
//
//        
//        delegate?.didCreateNewPlan(newPlan)
//        
////        if let tabBarController = self.tabBarController {
////            tabBarController.selectedIndex = 3 // Assuming the target tab index is 1
////            print("Switched to tab at index 1")
////        } else {
////            print("Error: Could not access tab bar controller")
////        }
//        
//        navigationController?.dismiss(animated: true) {
//            print("PlanViewController dismissed")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let planSelectionVC = storyboard.instantiateViewController(withIdentifier: "PlanSectionViewController") as? PlanSectionViewController {
//                // Pass plans and planNames arrays to the next view controller
//                planSelectionVC.plans = self.plans
//                planSelectionVC.planNames = self.planNames
//                self.navigationController?.pushViewController(planSelectionVC, animated: true)
//                print("Navigating to PlanSectionViewController")
//            }
//        }
//    }

