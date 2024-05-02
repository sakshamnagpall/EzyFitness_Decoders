//
//  SampleViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 02/05/24.
//

import UIKit
import WebKit
class SampleViewController: UIViewController {

   

    
    @IBOutlet weak var videoImageView: UIImageView!
    
    
    var webView: WKWebView?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Assuming videoImageView is a UIView where you want to display the GIF
          let videoFrame = CGRect(x: 0, y: 0, width: 200, height: 200) // Adjust dimensions as needed
          let webView = WKWebView(frame: videoFrame)
          self.view.addSubview(webView)
          self.webView = webView
          
          if let gifURL = Bundle.main.url(forResource: "strecth", withExtension: "gif") {
              let request = URLRequest(url: gifURL)
              webView.load(request)
          }
      }
}
