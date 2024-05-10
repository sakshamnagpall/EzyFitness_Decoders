//
//  PlanSectionViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 10/05/24.
//

import UIKit

class PlanSectionViewController: UIViewController, UITableViewDataSource {
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
    var plans : [Plan] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func addPlan() {
        
        let dur = Duration(hours: 0, minutes: 0)
        let newPlan = Plan(name: "", duration: dur)
        
       
        plans.append(newPlan)
        
        
        plantable.reloadData()
    }
    

    @IBAction func AddPlan(_ sender: Any) {
        addPlan()
    }
   
}
