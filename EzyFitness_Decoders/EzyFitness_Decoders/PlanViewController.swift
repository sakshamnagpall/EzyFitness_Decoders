//
//  PlanViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 06/05/24.
//

//import UIKit
//
//class PlanViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
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
//    @IBOutlet var tableView: UITableView!
//    
//    @IBOutlet weak var hourpicker: UIPickerView!
//    
//    @IBOutlet weak var minutespicker: UIPickerView!
//    
//    
//    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
//    var selectedHour: Int?
//    
//    let minutes = Array(0...59)
//    var selectedMinute: Int?
//    
//    let exercises = [
//        "Shoulder Strech",
//        "Side Bend",
//        "Seated March",
//        "Leg Extension",
//        "Upper Body Twist",
//        "Hamstring Strech",
//        "Neckroll",
//        "Ankle Rotation",
//        "Toe Lift",
//        "Ankle Rotation",
//        "Toe Lift"
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        hourpicker.delegate = self
//        hourpicker.dataSource = self
//        
//        minutespicker.delegate = self
//        minutespicker.dataSource = self
//        hourpicker.backgroundColor = .black
//        minutespicker.backgroundColor = .black
//        hourpicker.setValue(UIColor.white, forKey: "textColor")
//        minutespicker.setValue(UIColor.white, forKey: "textColor")
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        tableView.backgroundColor = .black
//        // Set the appearance mode of the table view to dark
//        if #available(iOS 13.0, *) {
//            tableView.overrideUserInterfaceStyle = .dark
//        }
//    }
//    
//    @IBAction func addButton(_ sender: Any) {
//        guard let hour = selectedHour, let minute = selectedMinute else {
//                    print("Please select both hour and minute.")
//                    return
//                }
//                
//                // Print the selected hour and minute
//                print("Selected time: \(hour):\(String(format: "%02d", minute))")
//    }
//    
//}
//
//extension PlanViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped me")
//    }
//}
//
//extension PlanViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 11
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = exercises[indexPath.row]
//        
//        cell.textLabel?.textColor = .white
//        return cell
//    }
//    
//}









//import UIKit
//
//class PlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
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
//    @IBOutlet var tableView: UITableView!
//    @IBOutlet weak var hourpicker: UIPickerView!
//    @IBOutlet weak var minutespicker: UIPickerView!
//    
//    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
//    var selectedHour: Int?
//    
//    let minutes = Array(0...59)
//    var selectedMinute: Int?
//    
//    let exercises = [
//        "Shoulder Strech",
//        "Side Bend",
//        "Seated March",
//        "Leg Extension",
//        "Upper Body Twist",
//        "Hamstring Strech",
//        "Neckroll",
//        "Ankle Rotation",
//        "Toe Lift",
//        "Ankle Rotation",
//        "Toe Lift"
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
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
//        // Set the appearance mode of the table view to dark
//        if #available(iOS 13.0, *) {
//            tableView.overrideUserInterfaceStyle = .dark
//        }
//    }
//    
//    @IBAction func addButton(_ sender: Any) {
//        guard let hour = selectedHour, let minute = selectedMinute else {
//            print("Please select both hour and minute.")
//            return
//        }
//        
//        // Print the selected time
//        print("Selected time: \(hour):\(String(format: "%02d", minute))")
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped me at index: \(indexPath.row)")
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return exercises.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else {
//            return UITableViewCell()
//        }
//        
//        // Check if index is within bounds of exercises array
//        if indexPath.row < exercises.count {
//            cell.textLabel?.text = exercises[indexPath.row]
//            cell.textLabel?.textColor = .white
//        }
//        
//        return cell
//    }
//    
//    
//}



import UIKit

class PlanViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {

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
    
    

    let hours = [0,1,2,3,4,5,6,7,8,9,10,11]
    var selectedHour: Int?

    let minutes = Array(0...59)
    var selectedMinute: Int?

    var exercises: [String] = ["Squats",
                               "Mountain Climbers",
                               "Butterfly Exercise",
                               "Leg Extension1",
                               "Push-Ups",
                               "Sit-Ups",
                               "Knee to Chest",
                               "Side Squats",
                               "Jumping Jacks",
                               "Plank",
                               "Toe Lift"]

    override func viewDidLoad() {
        super.viewDidLoad()
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

        // Set the appearance mode of the table view to dark
        if #available(iOS 13.0, *) {
            tableView.overrideUserInterfaceStyle = .dark
        }
    }

    @IBAction func addButton(_ sender: Any) {
        guard let planText = planname.text, !planText.isEmpty else {
                    print("Plan name is empty.")
                    return
                }

                // Print the selected time and the plan name
//                print("Selected time: \(hour):\(String(format: "%02d", minute))")
                print("Plan Name: \(planText)")
        
        guard let hour = selectedHour, let minute = selectedMinute else {
            print("Please select both hour and minute.")
            return
            
            
        }

        // Print the selected time
        print("Selected time: \(hour):\(String(format: "%02d", minute))")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me at index: \(indexPath.row)")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Check if index is within bounds of exercises array
        if indexPath.row < exercises.count {
            cell.textLabel?.text = exercises[indexPath.row]
            cell.textLabel?.textColor = .white
        }

        return cell
    }
}



