//
//  ButtonCollectionViewCell1CollectionViewCell.swift
//  EzyFitness_Decoders
//
//  Created by student on 02/05/24.
//

//import UIKit
//
//class ButtonCollectionViewCell1CollectionViewCell: UICollectionViewCell {
//    static let identifier = "ButtonCollectionViewCell1CollectionViewCell"
//    
//    private let button: UIButton = {
//        let button = UIButton()
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue // Change this to your desired background color
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        button.layer.cornerRadius = 16
//        button.clipsToBounds = true
//        return button
//    }()
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    
//    private func commonInit() {
//        contentView.addSubview(button)
//        button.frame = contentView.bounds
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        // Add the imageView as a subview of the button
//        button.addSubview(imageView)
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let imageSize = contentView.frame.width / 4 // Set image size to 1/10th of the button width
//        let padding: CGFloat = 10 // Padding value
//        
//        imageView.frame = CGRect(
//            x: contentView.frame.width - imageSize - padding, // 10 points from right wall
//            y: padding, // 10 points from top wall
//            width: imageSize,
//            height: imageSize
//        )
//        imageView.layer.cornerRadius = imageSize / 2 // Set corner radius for circular shape
//    }
//    
//    @objc private func buttonTapped() {
//        // Handle button tap event if needed
//    }
//    
//    func configure(title: String, image: UIImage?, color: UIColor) {
//        button.setTitle(title, for: .normal)
//        button.backgroundColor = color
//        imageView.image = image
//    }
//
//}




import UIKit

class CustomButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 20 // Padding from left
        titleLabel?.frame.origin.y = 20 // Padding from top
        titleLabel?.font = .boldSystemFont(ofSize: 13)
    }
}


//class ButtonCollectionViewCell1CollectionViewCell: UICollectionViewCell {
//    static let identifier = "ButtonCollectionViewCell1CollectionViewCell"
//    
//    private let button: CustomButton = {
//        let button = CustomButton()
//        button.backgroundColor = .systemBlue // Change this to your desired background color
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        button.layer.cornerRadius = 16
//        button.clipsToBounds = true
//        return button
//    }()
//    
//    private let valueLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        return label
//    }()
//    
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    
//    private func commonInit() {
//        contentView.addSubview(button)
//        button.frame = contentView.bounds
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        // Add the imageView as a subview of the button
//        button.addSubview(imageView)
//        
//        // Add the valueLabel as a subview of the button
//        button.addSubview(valueLabel)
//        
//        // Set the title label's content insets for padding
//        button.titleLabel?.numberOfLines = 0
//        button.titleLabel?.lineBreakMode = .byWordWrapping
//        button.contentVerticalAlignment = .top
//        button.contentHorizontalAlignment = .left
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let imageSize = contentView.frame.width / 4 // Set image size to 1/4th of the button width
//        let padding: CGFloat = 10 // Padding value
//        
//        imageView.frame = CGRect(
//            x: contentView.frame.width - imageSize - padding, // 10 points from right wall
//            y: padding, // 10 points from top wall
//            width: imageSize,
//            height: imageSize
//        )
//        imageView.layer.cornerRadius = imageSize / 2 // Set corner radius for circular shape
//        
//        valueLabel.frame = contentView.bounds // Label to cover the entire button
//    }
//    @objc private func buttonTapped() {
//        // Handle button tap event if needed
//    }
//    
//    func configure(title: String, value: String, image: UIImage?, color: UIColor) {
//        button.backgroundColor = color
//        imageView.image = image
//
//        // Set the title for the button
//        button.setTitle(title, for: .normal)
//        
//        // Set the value for the label
//        valueLabel.text = value
//        
//        // Adjust the button title's line break mode and number of lines
//        button.titleLabel?.lineBreakMode = .byWordWrapping
//        button.titleLabel?.numberOfLines = 0
//        
//        // Adjust the title label's font color based on the button background color
//        if color == .white {
//            button.setTitleColor(.black, for: .normal)
//        } else {
//            button.setTitleColor(.black, for: .normal)
//        }
//    }
//
//}




class ButtonCollectionViewCell1CollectionViewCell: UICollectionViewCell {
    static let identifier = "ButtonCollectionViewCell1CollectionViewCell"
    
    private let button: CustomButton = {
        let button = CustomButton()
        button.backgroundColor = .systemBlue // Change this to your desired background color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black // Set label text color to black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(button)
        button.frame = contentView.bounds
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add the imageView as a subview of the button
        button.addSubview(imageView)
        
        // Add the valueLabel as a subview of the button
        button.addSubview(valueLabel)
        
        // Set the title label's content insets for padding
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.contentVerticalAlignment = .top
        button.contentHorizontalAlignment = .left
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = contentView.frame.width / 4 // Set image size to 1/4th of the button width
        let padding: CGFloat = 10 // Padding value
        
        imageView.frame = CGRect(
            x: contentView.frame.width - imageSize - padding, // 10 points from right wall
            y: padding, // 10 points from top wall
            width: imageSize,
            height: imageSize
        )
        imageView.layer.cornerRadius = imageSize / 2 // Set corner radius for circular shape
        
        // Set label size to be 1/4th of the button size
        let labelWidth = contentView.frame.width / 2
        let labelHeight = contentView.frame.height / 2
        valueLabel.frame = CGRect(
            x: (contentView.frame.width - labelWidth) / 2,
            y: (contentView.frame.height - labelHeight) / 2,
            width: labelWidth,
            height: labelHeight
        )
    }
    
    @objc private func buttonTapped() {
        // Handle button tap event if needed
    }
    
    func configure(title: String, value: String, image: UIImage?, color: UIColor) {
        button.backgroundColor = color
        imageView.image = image

        // Set the title for the button
        button.setTitle(title, for: .normal)
        
        // Set the button title color to black
        button.setTitleColor(.black, for: .normal)
        
        // Set the value for the label
        valueLabel.text = value
        
        // Set label text color to black
        valueLabel.textColor = .black
    }
}
