//
//  ButtonCollectionViewCell1CollectionViewCell.swift
//  EzyFitness_Decoders
//
//  Created by student on 02/05/24.
//

import UIKit

class ButtonCollectionViewCell1CollectionViewCell: UICollectionViewCell {
    static let identifier = "ButtonCollectionViewCell1CollectionViewCell"
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue // Change this to your desired background color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = contentView.frame.width / 4 // Set image size to 1/10th of the button width
        let padding: CGFloat = 10 // Padding value
        
        imageView.frame = CGRect(
            x: contentView.frame.width - imageSize - padding, // 10 points from right wall
            y: padding, // 10 points from top wall
            width: imageSize,
            height: imageSize
        )
        imageView.layer.cornerRadius = imageSize / 2 // Set corner radius for circular shape
    }
    
    @objc private func buttonTapped() {
        // Handle button tap event if needed
    }
    
    func configure(title: String, image: UIImage?, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        imageView.image = image
    }

}
