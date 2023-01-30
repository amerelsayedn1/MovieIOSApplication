//
//  UpComingViewController.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 27/01/2023.
//

import UIKit

class UpComingViewController: UIViewController {

    var movies:[Movie] = [Movie]()
    
    private let upComingFeedsTable:UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.register(UpComingTableViewCell.self, forCellReuseIdentifier: UpComingTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(upComingFeedsTable)
        
        navigationItem.title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        upComingFeedsTable.delegate = self
        upComingFeedsTable.dataSource = self
        
        fetchUpComingMoviesFeeds()
    }

    
    override func viewDidLayoutSubviews() {
        upComingFeedsTable.frame=view.bounds
    }
    
    
    private func fetchUpComingMoviesFeeds(){
        APICaller.shared.getTrendingUpComingMovies{ [weak self] result in
            switch result {
            case .success(let movies):
                
                DispatchQueue.self.main.async {
                    self?.movies=movies
                    self?.upComingFeedsTable.reloadData()
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension UpComingViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpComingTableViewCell.identifier, for: indexPath) as? UpComingTableViewCell else{return UITableViewCell()}
        
        
        cell.configure(with: movies[indexPath.row])
        
        
        return cell
    }
}
