//
//  ShoulderStrechViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 02/05/24.
//

import UIKit
import WebKit

class ShoulderStrechViewController: UIViewController {

    @IBOutlet weak var videoImageView: UIImageView!
    
    var webView: WKWebView?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Assuming videoImageView is a UIView where you want to display the GIF
          let videoFrame = CGRect(x: 16, y: 161, width: 361, height: 274) // Adjust dimensions as needed
          let webView = WKWebView(frame: videoFrame)
          self.view.addSubview(webView)
          self.webView = webView
          
          if let gifURL = Bundle.main.url(forResource: "strecth", withExtension: "gif") {
              let request = URLRequest(url: gifURL)
              webView.load(request)
          }
      }

}
