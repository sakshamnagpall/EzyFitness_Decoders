
import UIKit

class StreakViewController: UIViewController {
    
    // Outlets for UI elements
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    
    // Properties to hold streak count and level
    var streakCount: Int = 12
    var level: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStreakCount() // Load the streak count when the view loads
        updateLabels() // Update UI labels
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateStreakForToday() // Update streak count when the view appears
    }
    
    // This function updates the streak count for today
    func updateStreakForToday() {
        let lastOpenedDate = UserDefaults.standard.object(forKey: "LastOpenedDate") as? Date ?? Date()
        let currentDate = Date()
        
        let calendar = Calendar.current
        if calendar.isDateInToday(lastOpenedDate) {
            // Do nothing if the app was already opened today
            return
        } else {
            // Increment streak count if the app wasn't opened today
            streakCount += 1
            UserDefaults.standard.set(currentDate, forKey: "LastOpenedDate")
            updateLabels() // Update UI labels
        }
    }
    
    // This function will be called whenever the user completes a task or takes an action to increase their streak
    func increaseStreak() {
        streakCount += 1
        // Check if the streak count is a multiple of 15 to determine if the user should level up
        if streakCount % 15 == 0 {
            level += 1
            // Update the level label
            levelLabel.text = "Level: \(level)"
        }
        updateLabels() // Update UI labels
    }
    
    // This function updates the streak and level labels
    func updateLabels() {
        streakLabel.text = "\(streakCount)"
        levelLabel.text = "Level: \(level)"
        saveStreakCount() // Save the streak count whenever it's updated
    }
    
    // This function saves the streak count to UserDefaults
    func saveStreakCount() {
        UserDefaults.standard.set(streakCount, forKey: "StreakCount")
    }
    
    // This function loads the streak count from UserDefaults
    func loadStreakCount() {
        streakCount = UserDefaults.standard.integer(forKey: "StreakCount")
    }
}
