//
//  UpComingTableViewCell.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 30/01/2023.
//

import UIKit

class UpComingTableViewCell: UITableViewCell {

   static let identifier = "UpComingTableViewCell"
    
    private let titleLable: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
        
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLable)
    }
    
    private func applyConstrains(){
        let moviesPosterUiImageViewConstrains = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:-15)
        ]
        NSLayoutConstraint.activate(moviesPosterUiImageViewConstrains)
    }
    
    
    public func configure(with model:Movie){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(String(describing: model.poster_path))") else {
                    return
                }
        posterImageView.sd_setImage(with: url, completed: nil)
        titleLable.text=model.original_title
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
