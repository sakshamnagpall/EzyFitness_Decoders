import UIKit

class Plan_S_ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let exercises = [
        "Shoulder Strech",
        "Side Bend",
        "Seated March",
        "Leg Extension",
        "Upper Body Twist",
        "Hamstring Strech",
        "Neckroll",
        "Ankle Rotation",
        "Toe Lift",
        "Ankle Rotation",
        "Toe Lift"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.backgroundColor = .clear
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .black
        // Set the appearance mode of the table view to dark
        if #available(iOS 13.0, *) {
            tableView.overrideUserInterfaceStyle = .dark
        }
        
    }
    
    
}

extension Plan_S_ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
    }
}

extension Plan_S_ViewController: UITableViewDataSource {
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


