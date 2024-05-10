//
//  Push-Ups.swift
//  exercisepage
//
//  Created by Akash Vishwakarma on 03/05/24.
//

import Foundation

import Foundation

import UIKit
import WebKit
import ImageIO

class PushUp: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gifURL = Bundle.main.url(forResource: "pushup", withExtension: "gif")!
        let imageData = try! Data(contentsOf: gifURL)
        let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil)
        
        let frameCount = CGImageSourceGetCount(imageSource!)
        
        var images = [UIImage]()
        for index in 0..<frameCount {
            let cgImage = CGImageSourceCreateImageAtIndex(imageSource!, index, nil)!
            images.append(UIImage(cgImage: cgImage))
        }
        
        gifImageView.animationImages = images
        gifImageView.animationDuration = Double(frameCount) / 0.5
        gifImageView.animationRepeatCount = 0
        
        gifImageView.startAnimating()
    }

}
