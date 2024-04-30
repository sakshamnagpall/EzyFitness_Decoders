


import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var proTableView: UITableViewCell!
    
    var profileCon = ["Edit Personal Data", "Activity Status", "Goal Preferences", "Achievements and Awards", "About App", "Share this App", "Rate Us", "FAQs" ]
    
    var profileIcon = ["figure.child","list.bullet.below.rectangle","flag.2.crossed","trophy","info.circle","square.and.arrow.up","star","message.badge"]
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        profileTableView.backgroundColor = .black
        
        // Set the appearance mode of the table view to dark
        if #available(iOS 13.0, *) {
            profileTableView.overrideUserInterfaceStyle = .dark
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileCon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(systemName: profileIcon[indexPath.row] )
        cell.imageView?.tintColor = .white
        cell.textLabel?.text = profileCon[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
    
}










































































































