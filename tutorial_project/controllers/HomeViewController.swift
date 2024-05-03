//
//  HomeViewController.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 27/01/2023.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    @IBOutlet var homeFeedTable: UITableView!
    
    let sectionTitles: [String] = ["Trending movies", "Trending Tv", "Popular", "UpComing Movies", "Top rated"]
    
    // No Need for this
//    private let homeFeedTable: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
//        return table
//    }()
    
//    private func configureNavbar() {
//        var image = UIImage(named: "netflixlogo")
//        image = image?.withRenderingMode(.alwaysOriginal)
//        let leftItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
//        leftItem.imageInsets = UIEdgeInsets(top: 2, left: -100.0, bottom: 0, right: 13.0)
//
//        navigationItem.leftBarButtonItem = leftItem
//
//        navigationItem.rightBarButtonItems = [
//            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
//            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
//        ]
//
//        navigationController?.navigationBar.tintColor = .black
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // No need to this
        /*
         view.backgroundColor = .systemBackground
         view.addSubview(homeFeedTable)
         */

        //        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        //=================================
        registerCell()
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
//        ==================
        
//        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 360))
        homeFeedTable.tableHeaderView = headerView
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        homeFeedTable.frame = view.bounds
//    }
    
    func registerCell() {
        // We should u this in the case of using XIB
        homeFeedTable.register(.init(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        /*
         // We should use this in the case of Class without xib
         homeFeedTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
         */
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {
            return UITableViewCell()
        }

        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies { result in
                switch result {
                case .success(let movies):
                    print(cell)
                    cell.configure(with: movies)
                // print(movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shared.getTrendingTvs { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                // print(movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.getPopularMovies { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                    // print(movies)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRatedMovies { result in

                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                // print(movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

        case Sections.Upcoming.rawValue:
            APICaller.shared.getTrendingUpComingMovies { result in

                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                // print(movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetters()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
