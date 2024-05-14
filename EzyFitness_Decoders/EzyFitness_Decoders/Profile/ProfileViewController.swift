


import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets for UI elements
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    // Variable to hold the passed user data
    var passedUser: User?
    
    // Arrays to hold profile content and corresponding icons
    var profileCon = ["Edit Personal Data", "Activity Status", "Goal Preferences", "Achievements and Awards", "About App", "Share this App", "Rate Us", "FAQs"]
    var profileIcon = ["figure.child", "list.bullet.below.rectangle", "flag.2.crossed", "trophy", "info.circle", "square.and.arrow.up", "star", "message.badge"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for the table view
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        // Set background color of the table view
        profileTableView.backgroundColor = .black
        
        // Check if user data is passed and update UI elements accordingly
        if let user = passedUser {
            profileName.text = user.username
            contactNumber.text = user.email
            
        } else {
            print("Passed User is nil")
        }
        
        // Set the appearance mode of the table view to dark if available
        if #available(iOS 13.0, *) {
            profileTableView.overrideUserInterfaceStyle = .dark
        }
    }
    
    // MARK: - UITableView Delegate and DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileCon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure cell with profile content and icons
        cell.imageView?.image = UIImage(systemName: profileIcon[indexPath.row])
        cell.imageView?.tintColor = .white
        cell.textLabel?.text = profileCon[indexPath.row]
        cell.textLabel?.textColor = .white
        
        return cell
    }
}

