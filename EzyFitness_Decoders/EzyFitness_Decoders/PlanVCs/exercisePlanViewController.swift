//
//  exercisePlanViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 13/05/24.
//

import UIKit
protocol ExerciseSelectionDelegate: AnyObject {
    func didSelectExercises(_ exercises: [String: Bool])
}


class exercisePlanViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    var plan: Plan?
    var selectedExercises: [String: Bool] = [:] {
        didSet {
            countLabel.text = " \(selectedExercises.values.filter { $0 }.count)"
        }
    }
    
    weak var delegate: ExerciseSelectionDelegate?

    @IBOutlet weak var segmentControl: UISegmentedControl!
       @IBOutlet weak var tableView: UITableView!
       @IBOutlet weak var countLabel: UILabel!
       
       let exercises = [
           ["Shoulder Stretch", "Side Bend", "Seated March", "Leg Extension", "Upper Body Twist", "Hamstring Stretch", "Neck Roll", "Ankle Rotation", "Toe Lift", "Ankle Rotation", "Toe Lift"],
           ["Squats", "Mountain Climbers", "Butterfly Exercise", "Leg Extension", "Push Ups", "Sit Ups", "Knee to Chest", "Side Squats", "Jumping Jacks", "Plank", "Toe Lift"]
       ]
       
       var cart: [String] = [] {
           didSet {
               countLabel?.text = "\(cart.count)"
           }
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
           if #available(iOS 13.0, *) {
               tableView.overrideUserInterfaceStyle = .dark
               
           }
           print(cart)
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return exercises[segmentControl.selectedSegmentIndex].count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
           let exercise = exercises[segmentControl.selectedSegmentIndex][indexPath.row]
           
           cell.textLabel?.text = exercise
           
           // Add accessory button based on whether the exercise is in cart
           let accessoryButton = UIButton(type: .detailDisclosure)
           accessoryButton.tag = indexPath.row
           accessoryButton.addTarget(self, action: #selector(showExerciseDetail(_:)), for: .touchUpInside)
           cell.accessoryView = accessoryButton
           
           if cart.contains(exercise) {
               cell.imageView?.image = UIImage(systemName: "checkmark.circle")
           } else {
               cell.imageView?.image = UIImage(systemName: "plus.circle")
           }
           
           return cell
       }
       
       @objc func showExerciseDetail(_ sender: UIButton) {
           let exerciseIndex = sender.tag
           let exercise = exercises[segmentControl.selectedSegmentIndex][exerciseIndex]
           
           // Perform segue to show exercise detail
           performSegue(withIdentifier: "ShowExerciseDetail", sender: exercise)
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let exercise = exercises[segmentControl.selectedSegmentIndex][indexPath.row]
           
           // Toggle exercise in cart
           if let index = cart.firstIndex(of: exercise) {
               cart.remove(at: index)
           } else {
               cart.append(exercise)
           }
           
           tableView.reloadData()
       }
    
        @IBAction func movein(_ sender: Any) {
            if let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanViewController") as? PlanViewController {
                destinationViewController.plan = plan
                destinationViewController.selectedExercises = cart
                present(destinationViewController, animated: true, completion: nil)
            }
        }
    
   
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowExerciseDetail",
              let exercise = sender as? String,
              let detailVC = segue.destination as? ExerciseDetailViewController {
               detailVC.exerciseName = exercise
           }
        if segue.identifier == "ExerciseToPlanSegue" {
            // No need to set delegate here
        }
       }
       
       @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
           tableView.reloadData()
       }
    
}

