import UIKit

// Protocol to communicate the selected plan name


class PlanSectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PlanViewControllerDelegate, ExerciseSelectionDelegate {
    func didSelectExercises(_ exercises: [String : Bool]) {
        print("Exercises selected!")
    }
    
    
    
    // Define plans array as an optional property of the class
    var plans: [Plan]?
    
    // Define a string array as an optional property to store plan names
    private var planNames: [String]?
    
    
    
    // Delegate to communicate the selected plan name
    weak var delegate: PlanViewControllerDelegate?
    
    @IBOutlet weak var plantable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        plantable.dataSource = self
        plantable.delegate = self
        plantable.register(UITableViewCell.self, forCellReuseIdentifier: "PlanCell")
        
        // Ensure the table view appears in dark mode
        if #available(iOS 13.0, *) {
            plantable.overrideUserInterfaceStyle = .dark
        }
        
        // Initialize plans and planNames arrays as nil
        plans = nil
        planNames = nil
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Check if plans and planNames are not nil, then return their count
        if let count = planNames?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell using the reuse identifier set in Interface Builder
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
        
        // Check if planNames is not nil and has the specified index
        if let planName = planNames?[indexPath.row] {
            // Configure the cell with plan name
            cell.textLabel?.text = planName
        } else {
            cell.textLabel?.text = "No Plan"
        }
        
        return cell
    }
    
    // MARK: - PlanViewControllerDelegate
    
    func didCreateNewPlan(_ plan: Plan) {
        // Initialize plans and planNames arrays if nil
        if plans == nil {
            plans = []
        }
        if planNames == nil {
            planNames = []
        }
        
        // Append the new plan
        plans?.append(plan)
        planNames?.append(plan.name)
        
        // Reload table view to reflect the changes
        plantable.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func AddPlan(_ sender: Any) {
        presentPlanViewController()
    }
    
    // MARK: - Helper Methods
    
    private func presentPlanViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let exercisePlanViewController = storyboard.instantiateViewController(withIdentifier: "exercisePlanViewController") as? exercisePlanViewController {
            exercisePlanViewController.delegate = self
            let navController = UINavigationController(rootViewController: exercisePlanViewController)
            present(navController, animated: true, completion: nil)
        }
    }
}


//import UIKit
//
//// Protocol to communicate the selected plan name
//protocol PlanSectionDelegate: AnyObject {
//    func didSelectPlan(_ planName: String)
//}
//
//class PlanSectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PlanViewControllerDelegate {
//    
//    
////    func didSelectExercises(_ exercises: [String : Bool]) {
////        print("Selected exercises: \(exercises)")
////    }
//    
//    
//    // Define plans array as a property of the class
//    var plans: [Plan] = []
//    
//    // Define a string array to store plan names
//    var planNames: [String] = []
//    
//    var newPlan: Plan?
//    
//    // Delegate to communicate the selected plan name
//    weak var delegate: PlanSectionDelegate?
//    
//    @IBOutlet weak var plantable: UITableView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Set up the table view
//        plantable.dataSource = self
//        plantable.delegate = self
//        plantable.register(UITableViewCell.self, forCellReuseIdentifier: "PlanCell")
//        if #available(iOS 13.0, *) {
//            plantable.overrideUserInterfaceStyle = .dark
//            
//        }
//        plantable.reloadData()
//        // Make sure to reload data when the view loads
//    }
//    
//    // MARK: - UITableViewDataSource
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return planNames.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Dequeue a cell using the reuse identifier set in Interface Builder
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
//                
//                // Configure the cell with plan name
//                let planName = planNames[indexPath.row]
//                cell.textLabel?.text = planName
//                
//                return cell
//    }
//    
//    // MARK: - PlanViewControllerDelegate
//    
//    func didCreateNewPlan(_ plan: Plan) {
//        // Append the plan name to the array
//        planNames.append(plan.name)
//               // Reload the table view to reflect the changes
//        plantable.reloadData()
//               // Notify the delegate
//        delegate?.didSelectPlan(plan.name)
//        
//    }
//    
//    // MARK: - Actions
//    
//    @IBAction func AddPlan(_ sender: Any) {
////        presentPlanViewController()
//        presentPlanViewController()
//    }
//    
//    
//   
//    func presentPlanViewController() {
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let exercisePlanViewController = storyboard.instantiateViewController(withIdentifier: "exercisePlanViewController") as? exercisePlanViewController {
//            let navController = UINavigationController(rootViewController: exercisePlanViewController)
//            present(navController, animated: true, completion: nil)
//        }
//    }
//
//}
//
