import Foundation

struct contactno{
    var contactnumber : String
}

struct ContactString{
    var contact: contactno
    
    // Modify the initializer to accept a ContactNo instance
    init(contact: contactno) {
        self.contact = contact
    }
    
    func printContactString() -> contactno{
        return contact
    }
}
// MARK: - Sign Up
struct SignUp {
    var name: String
    var contact: String
    var email: String
}

// MARK: - User


enum WorkoutFrequency: String, CaseIterable {
    case daily = "Daily"
    case everyOtherDay = "Every Other Day"
    case weekly = "Weekly"
    case biWeekly = "Bi-Weekly"
    // ... Add more options as needed
}

struct User {
    let id: UUID
    var username: String
    var email: String
    var height: String
    var weight: Double
    var fitnessGoals: [String]
    var workoutFrequency: WorkoutFrequency
    var bmi: Int?
    
    init(id: UUID, username: String, email : String, height: String, weight: Double, fitnessGoals: [String], workoutFrequency: WorkoutFrequency, bmi:Int) {
            self.id = id
            self.username = username
            self.email = email
            self.height = height
            self.weight = weight
            self.fitnessGoals = fitnessGoals
            self.workoutFrequency = workoutFrequency
            self.bmi = bmi
        }
    mutating func addname(username: String, email: String){
        self.username = username
        self.email = email
    }

    mutating func updateUserDetails(weight: Double, height: String, goals: [String], workoutFrequency: WorkoutFrequency, bmi: Int) {
        self.weight = weight
        self.height = height
        self.fitnessGoals = goals
        self.workoutFrequency = workoutFrequency
        self.bmi = bmi
    }
}


// MARK: - Home Page

enum WorkoutType: String, CaseIterable {
    case strengthTraining = "Strength Training"
    case cardio = "Cardio"
    case yoga = "Yoga"
    // ... Add more types as needed
}

struct TodayActivities {
    let user: User
//    var bmi: Double { // Computed property for BMI calculation
//        // Implement logic to calculate BMI based on user height and weight
////        user.height != 0 ? user.weight / (user.height * user.height) : 0
//    }
    var workoutCount: Int
    var caloriesBurned: Int
    var stepsCount: Int
    var appUsageTimeInMinutes: Int
}

struct ActivityCategory {
    let name: String
    let activities: [Activity]
}

struct Activity {
    let id: UUID // Changed to UUID for unique identifier
    let name: String
    let type: WorkoutType
    let exercises: [Exercise]? // Added optional exercises for each activity
}

struct Exercise { // Nested struct within Activity
    let name: String
    let sets: Int
    let reps: Int
    let weight: Int? // Optional for exercises without weight

    init(name: String, sets: Int, reps: Int, weight: Int? = nil) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
    }
}
//struct Workout{
//    let id: UUID
//    let name: String
//    let type: WorkoutType
//    let excercise:[Exercise]
//}

struct Routine {
    let id: UUID // Changed to UUID for unique identifier
    let name: String
    let description: String?
    let workoutList: [Activity]
}

// MARK: - Plan Page

//class Plan {
//    var name: String
//    var duration: Duration
//    var exercises: [String]
//    
//    init(name: String, duration: Duration, exercises: [String]) {
//        self.name = name 
//        self.duration = duration
//        self.exercises = exercises
//    }
//}
//
struct Duration {
    var hours: Int
    var minutes: Int
}

class Plan {
    var name: String
    var duration: Duration
    var exercises: [String]
    
    // Change the initializer to use var instead of let for parameters
    init(name: String, duration: Duration, exercises: [String]) {
        self.name = name
        self.duration = duration
        self.exercises = exercises
    }
}


enum SeatingOption: String {
    case sitting
    case spaceConstraint
}

struct PlanScreenModel {
    let seatingOption: SeatingOption // Selected seating option
    let exerciseCategories: [ActivityCategory] // Changed to ActivityCategory
}

// MARK: - Exercise Details Page

struct ExerciseDetails {
    let name: String
    let steps: [String]
}

// MARK: - Exercise Progress and Workout Time

struct ExerciseProgress {
    let currentExerciseNumber: Int // The number of the current exercise
    let totalExercises: Int // Total number of exercises in the workout
    let progressPercentage: Double // Progress percentage of the workout
    
    // Computed property to calculate progress percentage
    var calculatedProgressPercentage: Double {
        guard totalExercises > 0 else { return 0 }
        return Double(currentExerciseNumber) / Double(totalExercises) * 100.0
    }
}

struct WorkoutTime {
    let totalSeconds: Int // Total time of the workout in seconds
    
    // Function to format total time into HH:MM:SS
    func formattedString() -> String {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

// MARK: - History

struct ActivityStats {
    let date: Date
    var caloriesBurned: Int
    var steps: Int
    var water: Int
    var sleep: Double
    var heartRate: Int // Not optional
    var activeMinutes: Int // Not optional
}

struct Progress {
    var percentage: Double
}

// MARK: - Achievements

struct Achievements {
    var level: Int
    var daysUntilNextLevel: Int
    var consecutiveWorkoutDays: Int
}

struct Badge {
    let isNew: Bool
    let count: Int
}



extension UUID {
    static var unique: UUID {
        UUID()
    }
}

// MARK: - Sign Up

let signUpData = SignUp(name: "John Doe", contact: "1234567890", email: "john.doe@example.com")

// MARK: - User



// MARK: - Home Page
//
//let todayActivities = TodayActivities(user: user, workoutCount: 2, caloriesBurned: 300, stepsCount: 5000, appUsageTimeInMinutes: 60)

let strengthTrainingExercise = Exercise(name: "Squats", sets: 3, reps: 10, weight: 50)
let cardioExercise = Exercise(name: "Running", sets: 1, reps: 30)
let yogaExercise = Exercise(name: "Downward Dog", sets: 2, reps: 15)

let strengthTrainingActivity = Activity(id: .unique, name: "Strength Training", type: .strengthTraining, exercises: [strengthTrainingExercise])
let cardioActivity = Activity(id: .unique, name: "Cardio", type: .cardio, exercises: [cardioExercise])
let yogaActivity = Activity(id: .unique, name: "Yoga", type: .yoga, exercises: [yogaExercise])

let activityCategory = ActivityCategory(name: "Today's Activities", activities: [strengthTrainingActivity, cardioActivity, yogaActivity])

// MARK: - Plan Page

let seatedExercise = Exercise(name: "Seated Leg Press", sets: 3, reps: 12, weight: 80)
let spaceConstraintExercise = Exercise(name: "Burpees", sets: 3, reps: 10)

let seatedActivity = Activity(id: .unique, name: "Seated Exercises", type: .strengthTraining, exercises: [seatedExercise])
let spaceConstraintActivity = Activity(id: .unique, name: "Space-Constrained Exercises", type: .cardio, exercises: [spaceConstraintExercise])

let planScreenModel = PlanScreenModel(seatingOption: .sitting, exerciseCategories: [activityCategory])

// MARK: - Exercise Details Page

let exerciseDetails = ExerciseDetails(name: "Squats", steps: ["Stand with feet shoulder-width apart.", "Bend your knees and lower your body down."])

// MARK: - Exercise Progress and Workout Time

let exerciseProgress = ExerciseProgress(currentExerciseNumber: 1, totalExercises: 10, progressPercentage: 10.0)
let workoutTime = WorkoutTime(totalSeconds: 3600)

// MARK: - History

let activityStats = ActivityStats(date: Date(), caloriesBurned: 500, steps: 8000, water: 8, sleep: 7.5, heartRate: 75, activeMinutes: 60)

let progress = Progress(percentage: 50.0)

// MARK: - Achievements

let achievements = Achievements(level: 5, daysUntilNextLevel: 15, consecutiveWorkoutDays: 7)

let badge = Badge(isNew: true, count: 3)


class AppUserDataMoel {
    private var user : [User] = []
    init() {
        user.append(User(id: UUID(), username: "", email: "", height: "", weight: 0.00, fitnessGoals: [], workoutFrequency: .daily, bmi: 0))
    }
    func getUserDetails() -> [User] {
        return self.user
    }
    func updateUser(id : UUID , weight : Double , height : String , goal : [String] , workoutFrequency : WorkoutFrequency) {
        if let userID = user.firstIndex(where: {$0.id == id}) {
            user[userID].weight = weight
            user[userID].height = height
            user[userID].fitnessGoals = goal
            user[userID].workoutFrequency = workoutFrequency
        }
    }
    
}
var userDataModel = AppUserDataMoel()

