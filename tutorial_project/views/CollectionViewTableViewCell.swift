//
//  CollectionViewTableViewCell.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 27/01/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    
    var movies: [Movie] = .init()
    @IBOutlet var collectionView: UICollectionView?
    
//    private let collectionView:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 140, height: 200)
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
//        return collectionView
//    }()
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCEll()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
  
    }

    public func configure(with movies: [Movie]) {
        self.movies = movies
       
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func registerCEll() {
        collectionView?.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let model = movies[indexPath.row].poster_path!
        cell.configue(withe: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }
}
