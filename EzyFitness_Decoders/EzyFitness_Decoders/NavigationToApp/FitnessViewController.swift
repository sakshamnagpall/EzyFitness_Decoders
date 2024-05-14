//
//  FitnessViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 06/05/24.
//

//import UIKit
//
//class FitnessViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return choice.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return choice[row]
//    }
//    
//    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            selectedData = choice[row]
//    }
//  
//    var goals = ["/"]
//
//    @IBOutlet weak var picker: UIPickerView!
//    
//    @IBOutlet weak var BeHealthier: UIButton!
//    
//    @IBOutlet weak var BurnCalories: UIButton!
//    
//    @IBOutlet weak var BuildMuscle: UIButton!
//    
//    @IBOutlet weak var HeightinFeets: UITextField!
//    @IBOutlet weak var HeightinInches: UITextField!
//   
//    @IBOutlet weak var Weight: UITextField!
//    
//    var name: String?
//    var email: String?
//    var contactNumber: String?
//             
//    
//    @IBAction func CheckBoxBeHealthier(_ sender: UIButton) {
//        
//        let element = "Be Healthier"
//            if let index = goals.firstIndex(of: element) {
//                goals.remove(at: index)
//                BeHealthier.layer.borderColor = UIColor.clear.cgColor // Reset border color
//                print("\(element) removed from array")
//            } else {
//                goals.append(element)
//                BeHealthier.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
//                BeHealthier.layer.borderWidth = 5.0 // Set border width
//                BeHealthier.layer.cornerRadius = BeHealthier.frame.size.height / 2 // Make it rounded
//                print("\(element) added to array")
//            }
//        
//    }
//    
//    @IBAction func CheckboxBurnCalories(_ sender: Any) {
//        let element = "Burn Calories"
//            if let index = goals.firstIndex(of: element) {
//                goals.remove(at: index)
//                BurnCalories.layer.borderColor = UIColor.clear.cgColor // Reset border color
//                print("\(element) removed from array")
//            } else {
//                goals.append(element)
//                BurnCalories.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
//                BurnCalories.layer.borderWidth = 5.0 // Set border width
//                BurnCalories.layer.cornerRadius = BurnCalories.frame.size.height / 2 // Make it rounded
//                print("\(element) added to array")
//            }
//    }
//    
//    @IBAction func CheckBoxBuildMuscle(_ sender: Any) {
//        let element = "Build Muscles"
//            if let index = goals.firstIndex(of: element) {
//                goals.remove(at: index)
//                BuildMuscle.layer.borderColor = UIColor.clear.cgColor // Reset border color
//                print("\(element) removed from array")
//            } else {
//                goals.append(element)
//                BuildMuscle.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
//                BuildMuscle.layer.borderWidth = 5.0 // Set border width
//                BuildMuscle.layer.cornerRadius = BuildMuscle.frame.size.height / 2 // Make it rounded
//                print("\(element) added to array")
//            }
//        
//        
//    }
//    
//    
//    let choice = ["Daily","Every other day","Bi-Weekly","Weekly"]
//    var selectedData: String?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        picker.delegate = self
//        picker.dataSource = self
//        
//        picker.backgroundColor = UIColor.black
//        picker.setValue(UIColor.white, forKey: "textColor")
//
//        // Do any additional setup after loading the view.
//    }
//    @IBAction func submitButton(_ sender: Any) {
//        if let selectedData = selectedData {
//                   print("Selected data: \(selectedData)")
//               } else {
//                   print("No data selected.")
//               }
//        if let heightFeetText = HeightinFeets.text, let heightFeet = Double(heightFeetText),
//                   let heightInchesText = HeightinInches.text, let heightInches = Double(heightInchesText),
//                   let weightText = Weight.text, let weight = Double(weightText) {
//                    // Convert height to meters and weight to kilograms
//                    let heightInMeters = ((heightFeet * 12) + heightInches) * 0.0254
//                    let weightInKg = weight * 0.453592
//                    
//                    let bmi = calculateBMI(weightInKg: weightInKg, heightInM: heightInMeters)
//                    print("BMI: \(bmi)")
//            let newuser = User(id: UUID(),
//                               username: name ?? "",
//                               email: email ?? "",
//                               height: "\(heightFeetText) ft \(heightInchesText) inches",
//                               weight: weight,
//                               fitnessGoals: goals,
//                               workoutFrequency: WorkoutFrequency(rawValue: selectedData!) ?? .daily, // Use .Daily as the default value
//                               bmi: bmi)
//            
//                } else {
//                    print("Please enter valid height in feet and inches, and weight in pounds.")
//                }
//        
//        
//        
//        }
//    
//            
//    func calculateBMI(weightInKg: Double, heightInM: Double) -> Double {
//        return weightInKg / (heightInM * heightInM)
//    }
//}



import UIKit

class FitnessViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choice.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choice[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedData = choice[row]
    }
  
    var goals = ["/"]

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var BeHealthier: UIButton!
    
    @IBOutlet weak var BurnCalories: UIButton!
    
    @IBOutlet weak var BuildMuscle: UIButton!
    
    @IBOutlet weak var HeightinFeets: UITextField!
    @IBOutlet weak var HeightinInches: UITextField!
   
    @IBOutlet weak var Weight: UITextField!
    
    var name: String?
    var email: String?
    var contactNumber: String?
             
    
    @IBAction func CheckBoxBeHealthier(_ sender: UIButton) {
        
        let element = "Be Healthier"
            if let index = goals.firstIndex(of: element) {
                goals.remove(at: index)
                BeHealthier.layer.borderColor = UIColor.clear.cgColor // Reset border color
                print("\(element) removed from array")
            } else {
                goals.append(element)
                BeHealthier.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
                BeHealthier.layer.borderWidth = 5.0 // Set border width
                BeHealthier.layer.cornerRadius = BeHealthier.frame.size.height / 2 // Make it rounded
                print("\(element) added to array")
            }
        
    }
    
    @IBAction func CheckboxBurnCalories(_ sender: Any) {
        let element = "Burn Calories"
            if let index = goals.firstIndex(of: element) {
                goals.remove(at: index)
                BurnCalories.layer.borderColor = UIColor.clear.cgColor // Reset border color
                print("\(element) removed from array")
            } else {
                goals.append(element)
                BurnCalories.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
                BurnCalories.layer.borderWidth = 5.0 // Set border width
                BurnCalories.layer.cornerRadius = BurnCalories.frame.size.height / 2 // Make it rounded
                print("\(element) added to array")
            }
    }
    
    @IBAction func CheckBoxBuildMuscle(_ sender: Any) {
        let element = "Build Muscles"
            if let index = goals.firstIndex(of: element) {
                goals.remove(at: index)
                BuildMuscle.layer.borderColor = UIColor.clear.cgColor // Reset border color
                print("\(element) removed from array")
            } else {
                goals.append(element)
                BuildMuscle.layer.borderColor = UIColor(red: 225/255, green: 105/255, blue: 78/255, alpha: 1.0).cgColor // Set border color
                BuildMuscle.layer.borderWidth = 5.0 // Set border width
                BuildMuscle.layer.cornerRadius = BuildMuscle.frame.size.height / 2 // Make it rounded
                print("\(element) added to array")
            }
        
        
    }
    
    
    let choice = ["Daily","Every other day","Bi-Weekly","Weekly"]
    var selectedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.backgroundColor = UIColor.black
        picker.setValue(UIColor.white, forKey: "textColor")

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        if let selectedData = selectedData {
                   print("Selected data: \(selectedData)")
               } else {
                   print("No data selected.")
               }
        if let heightFeetText = HeightinFeets.text, let heightFeet = Double(heightFeetText),
                   let heightInchesText = HeightinInches.text, let heightInches = Double(heightInchesText),
                   let weightText = Weight.text, let weight = Double(weightText) {
                    // Convert height to meters and weight to kilograms
                    let heightInMeters = ((heightFeet * 12) + heightInches) * 0.0254
                    let weightInKg = weight * 0.453592
                    
                    let bmi = calculateBMI(weightInKg: weightInKg, heightInM: heightInMeters)
                    print("BMI: \(bmi)")
            let newuser = User(id: UUID(),
                               username: name ?? "",
                               email: email ?? "",
                               height: "\(heightFeetText) ft \(heightInchesText) inches",
                               weight: weight,
                               fitnessGoals: goals,
                               workoutFrequency: WorkoutFrequency(rawValue: selectedData!) ?? .daily, // Use .Daily as the default value
                               bmi: Int(bmi))
            
            performSegue(withIdentifier: "FitnessToTabBarSegue", sender: newuser)
            
                } else {
                    print("Please enter valid height in feet and inches, and weight in pounds.")
                }
        
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "FitnessToTabBarSegue" {
               if let tabBarVC = segue.destination as? tabBarViewController,
                  let newUser = sender as? User {
                   // Pass the new user data to tabBarViewController
                   tabBarVC.passedUser = newUser
               }
           }
       }
    
            
    func calculateBMI(weightInKg: Double, heightInM: Double) -> Double {
        return weightInKg / (heightInM * heightInM)
    }
}
