//
//  TitleCollectionViewCell.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 29/01/2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = nil
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configue(withe model:String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
                    return
                }
        posterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "heroImage"), completed: nil)
    }
    
}
