//
//  EzyFitnessDataModel.swift
//  EzyFitness_Decoders
//
//  Created by student on 25/04/24.
//

import Foundation

import UIKit

//  User Profikle


struct User{
    
    let height: Float
    
    let Weight: Float
    
    let goal: String
    
    let workoutFrequency: String
}


let user = User(height: 1.72, Weight: 67.0, goal: "Lose Weight", workoutFrequency: "Every Day")


// Home Page

//1. User: This struct stores the user's name, body mass index (BMI), calories burned, and step count.
//2. Activity: This struct stores the name, duration, and unit of a fitness activity. For example, you could create an Activity instance to represent the user's morning yoga session (name: "Morning Yoga", duration: 20, unit: "minutes").

struct User1 {
  let name: String
  let bmi: Float
  let caloriesBurned: Int
  let stepCount: Int
}

struct Activity22 {
  let name: String
  let duration: Int
  let unit: String
}

//This code creates a User instance to store the user's information and an array of Activity instances to represent the user's activities for the day.
//



let user1 = User1(name: "Zyan", bmi: 30.0, caloriesBurned: 600, stepCount: 10432)

let activities = [
  Activity22(name: "Morning Yoga", duration: 20, unit: "minutes"),
]





// Activity Page


//1. Activity: This struct stores the name, value and unit of a fitness activity metric. For example, you could create an Activity instance to represent the user's steps (name: "Steps", value: 10432, unit: "steps").

//2. Ring: This struct stores the name, current value, and goal of a fitness metric that can be displayed in a circular progress ring. For example, you could create a Ring instance to represent the user's active calories burned (name: "Active Calories", value: 498, goal: (optional)).


struct Activity1 {
  let name: String
  let value: Int
  let unit: String
}

struct Ring {
  let name: String
  let value: Double
  let goal: Double?
}

let activities22 = [
  Activity1(name: "Steps", value: 10432, unit: "steps"),
  Activity1(name: "Water", value: 8, unit: "glasses"),
  Activity1(name: "Sleep", value: 8, unit: "hours"),
]

let rings = [
  Ring(name: "Active Calories", value: 498, goal: nil),
  Ring(name: "Walk", value: 0.65, goal: 1.0),
]



// Daily Workout Page [Duration and all]

//1. Workout: This struct stores the duration (in seconds) and intensity of a workout.
//2. WorkoutIntensity: This enumeration defines the possible intensity levels for a workout (low, medium, high).


struct Workout {
    let duration: TimeInterval
    let intensity: WorkoutIntensity
}


enum WorkoutIntensity: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

//This code creates a workout instance that is 1200 seconds (20 minutes) long and has a medium intensity.

let workout = Workout(duration: 1200, intensity: .medium)




// Achievement Page

// 1. Activity: This struct stores the name and count of a fitness activity. For example, you could create an Activity instance to represent the user's step count (name: "Steps", count: 10432).
// 2. Achievement: This struct stores the name, image name, and description of a fitness achievement. For example, you could create an Achievement instance to represent the "Close Your Rings 7 Days in a Row" achievement (name: "Close Your Rings 7 Days in a Row", imageName: "seven_rings_achievement", description: "Earn this badge by closing your Activity rings for 7 days in a row").
//3. FitnessData: This struct stores the user's fitness data, including their strike count, current level, days remaining until they reach the next level, and a list of badges they have earned.



struct Actitvity2{
    let name: String
    let count: Int
}


struct Achievement{
    let name: String
    let imageName: String
    let description: String
}


struct FitnessData1{
    let strikeCount: Int
    let level: Int
    let daysToNextLevel: Int
    let badges: [String]
}

//This code creates an array of Activity instances to represent the user's move calories, exercise minutes, and stand hours. It then creates an array of Achievement instances to represent a new badge that the user has unlocked. Finally, it creates a FitnessData instance to store the user's strike count, current level, days remaining until they reach the next level, and an empty list of badges (since the badges are not shown in the image).


let activities1 = [
    Actitvity2(name: "Move", count: 567),
    Actitvity2(name: "Exercise", count: 30),
    Actitvity2(name: "Stand", count: 12),
]

let achievements = [
  Achievement(name: "New Badge!", imageName: "new_badge", description: "You’ve unlocked a new badge! Keep up the good work."),
]

let fitnessData = FitnessData1(strikeCount: 1224, level: 4, daysToNextLevel: 3, badges: [])




// Plan Page

//1. WorkoutPlan: This struct stores the name of the workout plan and an array of Exercise structs.
//2. Exercise: This struct stores the name of the exercise, the number of sets and repetitions, and a flag indicating whether there is a video available for the exercise.


struct WorkoutPlan{
    let name: String
    let exercises: [Exercise]
}

struct Exercise{
    let name: String
    let sets: Int
    let reps: Int
    let hasVideo: Bool
}


//This code creates an array of Exercise instances to represent the exercises in a sitting workout plan. It then creates a WorkoutPlan instance to store the name of the workout plan and the array of exercises.



let exercises = [
  Exercise(name: "Squats", sets: 3, reps: 12, hasVideo: false),
  Exercise(name: "Mountain Climbers", sets: 3, reps: 15, hasVideo: true),
  Exercise(name: "Butterfly Exercise", sets: 3, reps: 10, hasVideo: false),
  Exercise(name: "Push-Ups", sets: 3, reps: 8, hasVideo: false),
  Exercise(name: "Sit-Ups", sets: 3, reps: 15, hasVideo: false),
  Exercise(name: "Knee to Chest", sets: 3, reps: 12, hasVideo: false),
  Exercise(name: "Side Squats", sets: 3, reps: 10, hasVideo: false),
  Exercise(name: "Jumping Jacks", sets: 3, reps: 15, hasVideo: false),
  Exercise(name: "Plank", sets: 3, reps: 30, hasVideo: false),
]

let workoutPlan = WorkoutPlan(name: "Sitting Workout", exercises: exercises)


// Screen 15
//The code defines a struct named Activity:

//1. name: This string stores the name of the activity (e.g., "Move", "Exercise", or "Stand").
//2. completed: This double stores the value of the completed activity (e.g., 334 for move calories).
//3. goal: This double stores the goal for the activity (e.g., 567 for move calories).
//4. unit: This string stores the unit of the activity (e.g., "cal" for calories).

struct Activity3 {
  let name: String
  let completed: Double
  let goal: Double
  let unit: String
}

//This code creates an array of Activity instances to represent the user's move calories, exercise minutes, and stand hours.



let activities2 = [
  Activity3(name: "Move", completed: 334, goal: 567, unit: "cal"),
  Activity3(name: "Exercise", completed: 30, goal: 30, unit: "min"),
  Activity3(name: "Stand", completed: 12, goal: 12, unit: "hours"),
]



// Screen 12 ShoulderStrech


struct Exercise21 {
  let name: String
  let steps: [String]
}

let exercise = Exercise21(name: "Shoulder Stretch", steps: [
  "Raise one arm and bend it across your body.",
  "Use your other hand to gently pull the elbow towards your head.",
  "Hold for 10-30 seconds.",
  "Repeat on the other side."
])



