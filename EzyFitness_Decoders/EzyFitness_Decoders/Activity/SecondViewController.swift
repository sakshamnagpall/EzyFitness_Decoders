import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Hide the navigation bar when the view loads
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Show the navigation bar again when the view controller is about to disappear
            navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
