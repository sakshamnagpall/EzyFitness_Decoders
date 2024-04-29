import UIKit

class Plan_S_ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    let exercises = [
        "Shoulder Strech",
        "Side Bend",
        "Seated March"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
    }
    
}

extension Plan_S_ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
    }
}

extension Plan_S_ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row]
        return cell
    }
    
}


