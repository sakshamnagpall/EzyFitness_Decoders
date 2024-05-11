import UIKit


class PlanSectionViewController: UIViewController, UITableViewDataSource, PlanViewControllerDelegate {
    func didCreateNewPlan(_ plan: Plan) {
        plans.append(plan)
                
                // Reload the table view
        plantable.reloadData()
    }
    
    
    // Define plans array as a property of the class
    var plans: [Plan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
        let plan = plans[indexPath.row]
        
        cell.textLabel?.text = plan.name
        return cell
    }
    
    @IBOutlet weak var plantable: UITableView!
    
    @IBAction func AddPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let planViewController = storyboard.instantiateViewController(withIdentifier: "PlanViewController") as? PlanViewController {
                    // Set PlanSectionViewController as the delegate
                    planViewController.delegate = self
                    navigationController?.pushViewController(planViewController, animated: true)
                }
        
    }
}
