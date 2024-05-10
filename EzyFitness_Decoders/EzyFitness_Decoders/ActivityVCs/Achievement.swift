//
//  Achievement.swift
//  EzyFitness_Decoders
//
//  Created by student on 07/05/24.
//

import UIKit

class Achievement: UIViewController {

    @IBOutlet weak var strikecount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStreakCountIfNeeded()
            }
            
    func updateStreakCountIfNeeded() {
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
                if let lastUpdatedTimestamp = defaults.object(forKey: "lastUpdatedTimestamp") as? Date,
                   let streakCount = defaults.object(forKey: "streakCount") as? Int {
                    let currentTime = Date()
                    let timeInterval = currentTime.timeIntervalSince(lastUpdatedTimestamp)
                    let hoursSinceLastUpdate = timeInterval / 3600 // Convert seconds to hours
                    
                    if hoursSinceLastUpdate >= 24 {
                        // Reset streak count
                        defaults.set(0, forKey: "streakCount")
                        defaults.set(currentTime, forKey: "lastUpdatedTimestamp")
                        strikecount.text = "0"
                    } else {
                        // Update streak count label
                        strikecount.text = " \(streakCount) ⚡️"
                    }
                } else {
                    // Initialize streak count and timestamp
                    defaults.set(0, forKey: "streakCount")
                    defaults.set(Date(), forKey: "lastUpdatedTimestamp")
                    strikecount.text = "Streak: 0"
                }
            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
