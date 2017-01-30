//
//  MHPopularMovieViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHPopularMovieViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [MHMovie]()
    private let cellIdentifier = "PopularMovieTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataSourceFromServer()
        initialSetup()
    }
}

// MARK: - Private Extension
private extension MHPopularMovieViewController {
    
    func fetchDataSourceFromServer() {
        MHWebServiceManager.getMovieDetail(with: MHMovieDBAPI.getPopularMoviesURLString()) { [weak self] response, error in
            
            if let response = response {
                self?.movies = response
                dispatch_async(dispatch_get_main_queue(), {
                    self?.tableView.reloadData()
                })
            }
        }
    }
    
    func initialSetup() {
        self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
    }
}

// MARK: - UITableView datasource and delegate methods
extension MHPopularMovieViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MHTableViewCell
        cell.configureCell(with: movies[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}