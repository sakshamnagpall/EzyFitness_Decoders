//
//  ViewController.swift
//  WorkoutPage
//
//  Created by Akash Vishwakarma on 09/05/24.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var isPlaying = false
    var timer: Timer?
    var value: Float = 0.0
    var totalTime: Float = 60.0
    var isPaused: Bool = false
    var gifIndex: Int = 0
    let gifNames = ["legExtension", "neckRoll", "Plank", "pushup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playGif(at: gifIndex)
        isPlaying = true
        updatePlayPauseButton()
        
//        playPauseButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)

        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        startProgressTimer()
        playPauseButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func startProgressTimer() {
            let interval = totalTime / 100 // Divide total time by 100 for 100 updates
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
        
        @objc func updateProgress() {
            if !isPaused {
                value += 0.01
                progressBar.setProgress(value, animated: true)
                if value >= 1.0 {
                    // Move to the next GIF when progress is complete
                    gifIndex += 1
                    if gifIndex >= gifNames.count {
                        gifIndex = 0 // Loop back to the first GIF
                    }
                    playGif(at: gifIndex)
                }
                
                // Calculate remaining time and update the timer label
                let remainingTime = Int((1.0 - value) * totalTime)
                let minutes = remainingTime / 60
                let seconds = remainingTime % 60
                timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            }
        }
        
        func playGif(at index: Int) {
            let gifName = gifNames[index]
            
            // Load and set the GIF
            if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
                if let imageData = try? Data(contentsOf: gifURL) {
                    if let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) {
                        let frameCount = CGImageSourceGetCount(imageSource)
                        var images = [UIImage]()
                        for index in 0..<frameCount {
                            let cgImage = CGImageSourceCreateImageAtIndex(imageSource, index, nil)!
                            images.append(UIImage(cgImage: cgImage))
                        }
                        
                        // Set animation images and start animation
                        gifImageView.animationImages = images
                        gifImageView.animationDuration = Double(frameCount) / 1.0
                        gifImageView.animationRepeatCount = 0
                        gifImageView.startAnimating()
                        
                        // Reset progress value
                        value = 0.0
                        progressBar.setProgress(value, animated: false)
                    }
                }
            }
        }
        
        @objc func playPauseButtonTapped() {
            isPlaying = !isPlaying
                
                if isPlaying {
                    gifImageView.startAnimating()
                    startProgressTimer() // Start or resume the progress timer
                } else {
                    gifImageView.stopAnimating()
                    timer?.invalidate() // Pause the timer when paused
                }
                
                updatePlayPauseButton()
        }
        
        @objc func nextButtonTapped() {
            timer?.invalidate()
            gifIndex = (gifIndex + 1) % gifNames.count
            playGif(at: gifIndex)
            updatePlayPauseButton()
            startProgressTimer() // Restart progress timer
        }
        
        func updatePlayPauseButton() {
            let title = isPlaying ? "Pause" : "Play";                playPauseButton.setTitle(title, for: .normal)
        }
    }
