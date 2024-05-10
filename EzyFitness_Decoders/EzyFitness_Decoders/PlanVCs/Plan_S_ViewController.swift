//
//  ViewController.swift
//  segmentControl
//
//  Created by Akash Vishwakarma on 06/05/24.
//

import UIKit


class Plan_S_ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    let exercises1 = [
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
    
    let exercises2 = [
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
        // Do any additional setup after loading the view.
        searchBar.backgroundColor = .clear
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .none
        if #available(iOS 13.0, *) {
            tableView1.overrideUserInterfaceStyle = .dark
        }
        if #available(iOS 13.0, *) {
            tableView2.overrideUserInterfaceStyle = .dark
        }
        tableView1.dataSource = self
        tableView2.dataSource = self
        tableView1.isHidden = false
        tableView2.isHidden = true
        
        // Add targets to segmented control
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView1.isHidden = false
            tableView2.isHidden = true
        case 1:
            tableView1.isHidden = true
            tableView2.isHidden = false
        default:
            break
        }
    }
}
    extension Plan_S_ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of rows based on the selected table view
            if tableView == tableView1 {
                return exercises1.count
            } else if tableView == tableView2 {
                return exercises2.count
            }
            return 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            
            // Configure the cell based on the selected table view
            if tableView == tableView1 {
                cell.textLabel?.text = exercises1[indexPath.row]
            } else if tableView == tableView2 {
                cell.textLabel?.text = exercises2[indexPath.row]
            }
            
            return cell
        }
    
}

