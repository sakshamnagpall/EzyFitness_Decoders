//
//  ExerciseDetailViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 10/05/24.
//

import UIKit

class ExerciseDetailViewController: UIViewController {
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var stepsTextView: UITextView!
        var exerciseName: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let name = exerciseName {
                exerciseNameLabel.text = name
            }
            if let exerciseName = exerciseName {
                        if let gifURL = Bundle.main.url(forResource: "\(exerciseName.lowercased())", withExtension: "gif") {
                            do {
                                let imageData = try Data(contentsOf: gifURL)
                                let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil)
                                let frameCount = CGImageSourceGetCount(imageSource!)
                                
                                var images = [UIImage]()
                                for index in 0..<frameCount {
                                    let cgImage = CGImageSourceCreateImageAtIndex(imageSource!, index, nil)!
                                    images.append(UIImage(cgImage: cgImage))
                                }
                                
                                gifImageView.animationImages = images
                                gifImageView.animationDuration = Double(frameCount) / 1.0
                                gifImageView.animationRepeatCount = 0
                                
                                gifImageView.startAnimating()
                            } catch {
                                print("Error loading GIF:", error)
                            }
                        } else {
                            print("GIF not found for \(exerciseName)")
                        }
                        
                        // Assuming you have a dictionary mapping exercise names to steps
                        if let steps = stepsForExercise(name: exerciseName) {
                            let stepsText = steps.joined(separator: "\n")
                            stepsTextView.text = stepsText
                        }
                    }
                    
                    stepsTextView.isEditable = false
        }
    
    func stepsForExercise(name: String) -> [String]? {
           // Implement a method to fetch steps based on exercise name
           // You can use a dictionary, switch statement, or any other method to get steps
           // Return nil or an empty array if steps are not available for the exercise
           // Example:
           let stepsDict: [String: [String]] = [
               "Shoulder Stretch": ["Step 1: Raise your right arm: Extend it straight up without shrugging, keeping it parallel to your body.", "Step 2:Hold for 10 seconds: Maintain the raised position, feeling the stretch along your side.", "Step 3:Switch arms: Lower your right arm and raise your left, repeating the stretch.", "Step 4:Repeat as needed: Perform the stretch to alleviate tension and improve flexibility in your shoulders."],
              
               "Side Bend":[
                "Step 1: Sit up straight: Maintain good posture.",
               "Step 2: Arms overhead: Extend arms up, parallel to ears.",
                "Step 3:Lean to the side: Bend gently to the right or left.",
                "Step 4:Hold and return: Hold the stretch, then return to center. Repeat on the opposite side."
               ],
               "Toe Lift":[
               "Step 1: Sit or stand: Begin in a comfortable position with your back straight.",
               "Step 2: Lift your toes: Keep your heels on the ground and raise only your toes.",
               "Step 3: Hold briefly: Maintain the lifted position for a few seconds.",
               "Step 4: Lower your toes: Gently return them to the ground."
               ],
               "Squats":[
                "Step 1:Stand with feet shoulder-width apart: Keep your back straight, chest up, and core engaged.",
               "Step 2: Lower your body: Bend your knees and push your hips back as if you're sitting down, keeping your weight on your heels.",
                "Step 3:Lower until thighs are parallel to the ground: Aim for a 90-degree angle at the knees, ensuring they don't extend beyond your toes.",
                "Step 4:Push through your heels: Straighten your legs to return to the starting position."
               ],
               "Jumping Jacks":[
               " Step 1:Start position: Stand with your feet together and arms by your sides.",
                "Step 2:Jump and spread: Simultaneously jump your feet out to the sides while raising your arms above your head.",
                "Step 3:Return to start: Jump back to the starting position with feet together and arms by your sides.",
               
                "Step 4:Repeat: Continue jumping in and out, maintaining a steady rhythm."
               ],
               "Seated March":["Step 1:Sit upright: Maintain good posture on a chair.",
                              "Step 2: Lift one knee: Raise it towards your chest.",
                              "Step 3: Lower the knee: Return it to the starting position.",
                               "Step 4:Switch legs: Alternate between legs in a controlled rhythm."
               ],
               "Leg Extension":["Step 1: Sit on a chair with back straight and feet flat",
                   "Step 2: Extend one leg in front, keeping knee slightly bent.",
                   "Step 3: Hold for a few seconds, feeling quadriceps stretch.",
                   "Step 4: Slowly lower leg back down and switch sides. Repeat"],
               
               "Upper Body Twist": ["Step 1 :  Sit upright in a chair with your feet flat on the ground.",
                   "Step 2 : Place your right hand on the outside of your left knee.",
                    " Step 3 : Inhale and lengthen your spine, then exhale as you gently twist your torso to the left, using your hand on your knee to deepen the stretch.",
                                    "Step 4 : Hold the twist for 15-30 seconds, then return to the center. Repeat on the other side. Aim for 2-3 repetitions on each side."],
               "Hamstring Stretch": ["Step 1: Sit on the edge of a chair with your feet flat and knees bent.",
                                             "Step 2: Straighten one leg out in front of you, heel on the ground, toes up.",
                                             "Step 3: Keep your back straight and lean forward from your hips until you feel a gentle stretch in your hamstring.",
                                             "Step 4: Hold the stretch for 15-30 seconds, then switch legs. Repeat 2-3 times on each leg."],
                       
                       "Neck Roll": ["Step 1: Sit with a straight back in a comfortable position.",
                                     "Step 2: Slowly drop your chin towards your chest, feeling the stretch in the back of your neck.",
                                     "Step 3: Gently roll your head to the right, bringing your right ear towards your right shoulder. Then continue rolling until your left ear reaches your left shoulder.",
                                     "Step 4: Reverse the motion and repeat in the opposite direction. Aim for 3-5 neck rolls in each direction, moving slowly and mindfully."],
                       
                       "Ankle Rotation": ["Step 1: Sit on a chair with your feet flat on the ground.",
                                          "Step 2: Lift one foot off the ground and rotate your ankle in a circular motion, first clockwise and then counterclockwise.",
                                          "Step 3: Perform 10-15 rotations in each direction.",
                                          "Step 4: Switch to the other foot and repeat the exercise."],
                       
                       "Toe Lifts": ["Step 1: Sit on a chair with your feet flat on the ground.",
                                     "Step 2: Lift one foot off the ground and rotate your ankle in a circular motion, first clockwise and then counterclockwise.",
                                     "Step 3: Perform 10-15 rotations in each direction.",
                                     "Step 4: Switch to the other foot and repeat the exercise."],
                       
                       "Mountain Climbers": ["Step 1: Begin in a high plank position, hands under shoulders.",
                                            "Step 2: Bring right knee to chest, maintaining core engagement.",
                                            "Step 3: Quickly switch, bringing left knee to chest while extending right leg back.",
                                            "Step 4: Alternate legs rapidly for 30-60 seconds, keeping proper form."],
                       
                       "Butterfly Exercise": ["Step 1: Sit on the floor, soles of feet together, knees bent out.",
                                     "Step 2: Hold ankles or feet with hands.",
                                     "Step 3: Keep back straight, press knees towards floor using elbows.",
                                     "Step 4: Hold stretch for 15-30 seconds, repeat 2-3 times."],
                       
                       "Push Ups": ["Step 1: Begin in a high plank, hands slightly wider than shoulders.",
                                   "Step 2: Lower body by bending elbows, keeping them close.",
                                   "Step 3: Lower until chest nearly touches floor.",
                                   "Step 4: Push through palms to straighten arms and return to start."],
                       
                       "Sit Ups": ["Step 1: Lie on back, knees bent, feet flat.",
                                  "Step 2: Place hands behind head or crossed over chest.",
                                  "Step 3: Engage core, lift upper body towards knees.",
                                  "Step 4: Slowly lower back down with control. Repeat 10-15 times."],
                       
                       "Knee to Chest": ["Step 1: Lie on back, legs extended, arms by sides.",
                                         "Step 2: Bend one knee, hug it to chest, keeping other leg straight.",
                                         "Step 3: Hold stretch for 15-30 seconds, feeling gentle stretch in lower back and hip.",
                                         "Step 4: Switch legs, repeat. Do 2-3 repetitions on each leg."],
                       
                       "Side Squats": ["Step 1: Stand with your feet shoulder-width apart and arms at your sides.",
                                       "Step 2: Take a wide step to the right, bending your right knee and pushing your hips back as if sitting into a chair.",
                                       "Step 3: Keep your left leg straight and your chest up.",
                                       "Step 4: Push through your right heel to return to the starting position.",
                                       "Step 5: Repeat on the left side, alternating sides for the desired number of repetitions."],
               "Plank":[
                "Step 1:Start by lying face down with elbows under shoulders.",
                "Step 2:Lift body, keeping a straight line from head to heels.",
                "Step 3:Hold position, engaging core muscles.",
                "Step 4:Aim for a duration of 10-20 seconds, increasing gradually.",
               " Step 5:Lower back down and repeat for desired sets."],
               // Add steps for other exercises...
           ]
           return stepsDict[name]
       }
   }

