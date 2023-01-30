//
//  HeroHeaderUIView.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 27/01/2023.
//

import UIKit
import SDWebImage

class HeroHeaderUIView: UIView {

    private let heroImageView : UIImageView = {
        let imageView = UIImageView()
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/wbCt8M0wDQxhhCa85yLgBvd5wMw.jpg")!
        imageView.sd_setImage(with: imageURL)
        
        
        
        
        return imageView
    }()
    
    private let playButton:UIButton = {
        
        let button=UIButton()
        button.setTitle("play", for: .normal)
        button.layer.borderColor=UIColor.black.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth=1
        button.translatesAutoresizingMaskIntoConstraints=false
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    private let downloadButton:UIButton = {
        
        let button=UIButton()
        button.setTitle("Downalod", for: .normal)
        button.layer.borderColor=UIColor.black.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth=1
        button.translatesAutoresizingMaskIntoConstraints=false
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    
    private func addGradient(){
        let gradientLayer=CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstrains(){
        let playButtonConstrains = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonConstains = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playButtonConstrains)
        NSLayoutConstraint.activate(downloadButtonConstains)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstrains()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame=bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
