//
//  Exercise_8_ViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 30/04/24.
//

import UIKit
import WebKit
class Exercise_8_ViewController: UIViewController {

    @IBOutlet weak var videoImageView: UIImageView!
    
    var webView: WKWebView?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Assuming videoImageView is a UIView where you want to display the GIF
          let videoFrame = CGRect(x: 16, y: 113, width: 361, height: 362) // Adjust dimensions as needed
          let webView = WKWebView(frame: videoFrame)
          self.view.addSubview(webView)
          self.webView = webView
          
          if let gifURL = Bundle.main.url(forResource: "strecth", withExtension: "gif") {
              let request = URLRequest(url: gifURL)
              webView.load(request)
          }
      }
}
