//
//  ViewController.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 27/01/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let home=UINavigationController(rootViewController: HomeViewController())
        let upcoming=UINavigationController(rootViewController: UpComingViewController())
        let search=UINavigationController(rootViewController: SearchViewController())
        let download=UINavigationController(rootViewController: DownloadViewController())
        
        home.tabBarItem.image = UIImage(systemName: "house");
        upcoming.tabBarItem.image = UIImage(systemName: "play.circle");
        search.tabBarItem.image = UIImage(systemName:"magnifyingglass");
        download.tabBarItem.image = UIImage(systemName: "arrow.down.to.line");
        
        home.title="Home"
        upcoming.title="Coming soon"
        search.title="Top Search"
        download.title="Downloads"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([home,upcoming,search,download], animated: true)
    }


}

