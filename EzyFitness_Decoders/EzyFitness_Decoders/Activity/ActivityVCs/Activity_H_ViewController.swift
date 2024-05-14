//
//  Activity_H_ViewController.swift
//  EzyFitness_Decoders
//
//  Created by student on 25/04/24.
//

//import UIKit
//import CHTCollectionViewWaterfallLayout
//
//class Activity_H_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
//    
//    
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    struct Model {
//        let buttonText: String
//        let height: CGFloat
//        let buttonColor: UIColor
//    }
//    
//    private var models = [Model]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let layout = CHTCollectionViewWaterfallLayout()
//               layout.itemRenderDirection = .leftToRight
//               layout.columnCount = 2
//        view.backgroundColor = .black
//        collectionView.backgroundColor = .black
//               
//               collectionView.collectionViewLayout = layout
//               collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
//        
//        let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8"]
//
//        // Define RGB values for your colors
//        let buttonRGBColors: [(CGFloat, CGFloat, CGFloat)] = [
//            (156, 196, 144),     // Red
//            (255, 186, 145),     // Blue
//            (185, 243, 244),     // Green
//            (191, 212, 231),   // Orange
//            (217, 208, 229),   // Purple
//            (239, 178, 185),   // Cyan
//            (251, 229, 156),
//            (251, 229, 156),
//        ]
//        
//        models = zip(buttonTitles, buttonRGBColors).map { (title, rgbColor) in
//            let color = UIColor(
//                red: CGFloat(rgbColor.0) / 255.0,
//                green: CGFloat(rgbColor.1) / 255.0,
//                blue: CGFloat(rgbColor.2) / 255.0,
//                alpha: 1.0
//            )
//            return Model(buttonText: title, height: CGFloat.random(in: 150...350), buttonColor: color)
//        }
//
//        
////        let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8", "Button 9"]
////        let buttonColors: [UIColor] = [.red, .blue, .green, .orange, .purple, .cyan, .magenta, .brown, .gray]
////        models = zip(buttonTitles, buttonColors).map { (title, color) in
////            return Model(buttonText: title, height: CGFloat.random(in: 200...400), buttonColor: color)
////        }
//
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return models.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier, for: indexPath) as? ButtonCollectionViewCell1CollectionViewCell else {
//            fatalError()
//        }
//        
//        let model = models[indexPath.row]
//            let imageName = "im\(indexPath.row + 1)" // Assuming your image names follow the pattern "image1", "image2", etc.
//            let image = UIImage(named: imageName)
//            cell.configure(title: model.buttonText, image: image, color: model.buttonColor)
//            
//            return cell
//        
////        let model = models[indexPath.row]
////        cell.configure(title: model.buttonText, image: UIImage(named: "image1"), color: model.buttonColor) // Pass your image here
////
////        return cell
//    }
//
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width / 2, height: models[indexPath.row].height)
//    }
//
//}



//import UIKit
//import CHTCollectionViewWaterfallLayout
//
//class Activity_H_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    
//    struct Model {
//        let buttonText: String
//        let height: CGFloat
//        let buttonColor: UIColor
//    }
//    
//    private var models = [Model]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let layout = CHTCollectionViewWaterfallLayout()
//               layout.itemRenderDirection = .leftToRight
//               layout.columnCount = 2
//        view.backgroundColor = .black
//        collectionView.backgroundColor = .black
//               
//               collectionView.collectionViewLayout = layout
//               collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
//        
//        let buttonTitles = ["Daily Challenge", "Calories", "Water", "Walk", "Sleep", "Heart", "Time Invested"]
//
//        // Define RGB values for your colors
//        let buttonRGBColors: [(CGFloat, CGFloat, CGFloat)] = [
//            (156, 196, 144),     // Red
//            (255, 186, 145),     // Blue
//            (185, 243, 244),     // Green
//            (191, 212, 231),   // Orange
//            (217, 208, 229),   // Purple
//            (239, 178, 185),   // Cyan
//            (251, 229, 156),
//            (251, 229, 156),
//        ]
//        
//        models = zip(buttonTitles, buttonRGBColors).map { (title, rgbColor) in
//            let color = UIColor(
//                red: CGFloat(rgbColor.0) / 255.0,
//                green: CGFloat(rgbColor.1) / 255.0,
//                blue: CGFloat(rgbColor.2) / 255.0,
//                alpha: 1.0
//            )
//            return Model(buttonText: title, height: CGFloat.random(in: 150...350), buttonColor: color)
//        }
//
//        
////        let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8", "Button 9"]
////        let buttonColors: [UIColor] = [.red, .blue, .green, .orange, .purple, .cyan, .magenta, .brown, .gray]
////        models = zip(buttonTitles, buttonColors).map { (title, color) in
////            return Model(buttonText: title, height: CGFloat.random(in: 200...400), buttonColor: color)
////        }
//
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return models.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier, for: indexPath) as? ButtonCollectionViewCell1CollectionViewCell else {
//            fatalError()
//        }
//        
//        let model = models[indexPath.row]
//            let imageName = "im\(indexPath.row + 1)" // Assuming your image names follow the pattern "image1", "image2", etc.
//            let image = UIImage(named: imageName)
//        cell.configure(title: model.buttonText, value: "New Value", image: image, color: model.buttonColor)
//            
//            return cell
//        
////        let model = models[indexPath.row]
////        cell.configure(title: model.buttonText, image: UIImage(named: "image1"), color: model.buttonColor) // Pass your image here
////
////        return cell
//    }
//
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width / 2, height: models[indexPath.row].height)
//    }
//}





import UIKit
import CHTCollectionViewWaterfallLayout

class Activity_H_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    struct Model {
        let buttonText: String
        let height: CGFloat
        let buttonColor: UIColor
    }
    
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = CHTCollectionViewWaterfallLayout()
               layout.itemRenderDirection = .leftToRight
               layout.columnCount = 2
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
               
               collectionView.collectionViewLayout = layout
               collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
        
        let buttonTitles = ["Daily Challenge", "Calories", "Water", "Walk", "Sleep", "Heart", "Diet", "Time Invested"]

        // Define RGB values for your colors
        let buttonRGBColors: [(CGFloat, CGFloat, CGFloat)] = [
            (156, 196, 144),     // Red
            (255, 186, 145),     // Blue
            (185, 243, 244),     // Green
            (191, 212, 231),   // Orange
            (217, 208, 229),   // Purple
            (239, 178, 185),   // Cyan
            (251, 229, 156),
            (192, 174, 149),
        ]
        
        models = zip(buttonTitles, buttonRGBColors).map { (title, rgbColor) in
            let color = UIColor(
                red: CGFloat(rgbColor.0) / 255.0,
                green: CGFloat(rgbColor.1) / 255.0,
                blue: CGFloat(rgbColor.2) / 255.0,
                alpha: 1.0
            )
            return Model(buttonText: title, height: CGFloat.random(in: 150...350), buttonColor: color)
        }

        
//        let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8", "Button 9"]
//        let buttonColors: [UIColor] = [.red, .blue, .green, .orange, .purple, .cyan, .magenta, .brown, .gray]
//        models = zip(buttonTitles, buttonColors).map { (title, color) in
//            return Model(buttonText: title, height: CGFloat.random(in: 200...400), buttonColor: color)
//        }

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ButtonCollectionViewCell1CollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell1CollectionViewCell.identifier, for: indexPath) as? ButtonCollectionViewCell1CollectionViewCell else {
            fatalError()
        }
        
        let model = models[indexPath.row]
        let imageName = "im\(indexPath.row + 1)" // Assuming your image names follow the pattern "image1", "image2", etc.
        let image = UIImage(named: imageName)
        
        // Assuming you have an array of different labels
        let labels = ["60%", "362 calories", "8/10", "10400 Steps", "8 hours", "129 BPM", "252 cal", "45 Minutes"]
        
        
        cell.configure(title: model.buttonText, value: labels[indexPath.row], image: image, color: model.buttonColor)
            
        return cell
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: models[indexPath.row].height)
    }
}
