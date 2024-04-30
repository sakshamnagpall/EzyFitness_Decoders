import UIKit

class Plan_Space_ViewController: UIViewController {
    
    @IBOutlet var tableView:UITableView!
    
    let exercises = [
        "Squats",
        "Mountain Climbers",
        "Butterfly Exercise",
        "Leg Extension",
        "Push-Ups",
        "Sit-Ups",
        "Knee to Chest",
        "Side Squats",
        "Jumping Jacks",
        "Plank",
        "Toe Lift"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .black
        // Set the appearance mode of the table view to dark
        if #available(iOS 13.0, *) {
            tableView.overrideUserInterfaceStyle = .dark
        }
        
    }
    
    
}

extension Plan_Space_ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
    }
}

extension Plan_Space_ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row]
        
        cell.textLabel?.textColor = .white
        return cell
    }
    
}


