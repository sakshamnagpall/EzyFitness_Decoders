import UIKit

protocol ExerciseSelectionDelegate: AnyObject {
    func didSelectExercises(_ exercises: [String: Bool])
}

class ExerciseViewController: UIViewController {

    weak var delegate: ExerciseSelectionDelegate?

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var selectedExercises: [String: Bool] = [:] {
        didSet {
            countLabel.text = " \(selectedExercises.filter { $0.value }.count)"
        }
    }

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
        "Leg Extension1",
        "Push-Ups",
        "Sit-Ups",
        "Knee to Chest",
        "Side Squats",
        "Jumping Jacks",
        "Plank",
        "Toe Lift"
    ]

    let exerciseViewControllers: [String: String] = [
        "Shoulder Strech": "ShoulderStretchViewController",
        "Side Bend": "SideBendViewController",
        "Seated March": "SeatedMarchViewController",
        // Add mapping for other exercises as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            tableView1.overrideUserInterfaceStyle = .dark
            tableView2.overrideUserInterfaceStyle = .dark
        }
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView1.isHidden = false
        tableView2.isHidden = true

        // Initialize selected exercises to false for all exercises
        for exercise in exercises1 {
            selectedExercises[exercise] = false
        }
        for exercise in exercises2 {
            selectedExercises[exercise] = false
        }
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")

        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }

    @IBAction func addExercise(_ sender: UIButton) {
        guard let tableView = segmentedControl.selectedSegmentIndex == 0 ? tableView1 : tableView2 else {
            print("Table view is not set")
            return
        }

        let buttonPosition = sender.convert(CGPoint.zero, to: tableView)

        guard let indexPath = tableView.indexPathForRow(at: buttonPosition) else {
            print("Failed to retrieve indexPath")
            return
        }

        let exerciseName = segmentedControl.selectedSegmentIndex == 0 ? exercises1[indexPath.row] : exercises2[indexPath.row]

        selectedExercises[exerciseName] = !(selectedExercises[exerciseName] ?? false)

        tableView.reloadData()
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        tableView1.isHidden = sender.selectedSegmentIndex == 1
        tableView2.isHidden = sender.selectedSegmentIndex == 0
        countLabel.text = " \(selectedExercises.filter { $0.value }.count)"
    }

    @IBAction func movein(_ sender: Any) {
        let dur = Duration(hours: 0, minutes: 0)
        let plan = Plan(name: "", duration: dur)
//        plan.addNewArray(exercises: selectedExercises)
//        print(plan.printAllElements())
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExerciseToPlanSegue" {
            // No need to set delegate here
        }
    }
}

extension ExerciseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControl.selectedSegmentIndex == 0 ? exercises1.count : exercises2.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let exerciseName = segmentedControl.selectedSegmentIndex == 0 ? exercises1[indexPath.row] : exercises2[indexPath.row]

        cell.textLabel?.text = exerciseName
        let isSelected = selectedExercises[exerciseName] ?? false
        let imageName = isSelected ? "checkmark.circle.fill" : "plus.circle"
        if let image = UIImage(systemName: imageName) {
            let button = UIButton(type: .custom)
            button.setImage(image, for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            button.addTarget(self, action: #selector(addExercise(_:)), for: .touchUpInside)
            cell.accessoryView = button
        }
        

        return cell
    }
}

extension ExerciseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exerciseName = segmentedControl.selectedSegmentIndex == 0 ? exercises1[indexPath.row] : exercises2[indexPath.row]

        guard let viewControllerIdentifier = exerciseViewControllers[exerciseName],
              let selectedExerciseVC = storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) else {
            return
        }

        navigationController?.pushViewController(selectedExerciseVC, animated: true)
        
    }
}

extension ExerciseViewController: ExerciseSelectionDelegate {
    func didSelectExercises(_ exercises: [String : Bool]) {
        delegate?.didSelectExercises(exercises)
    }
}
