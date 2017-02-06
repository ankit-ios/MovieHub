//
//  MHTabbarContainerViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

//getting more movies with respect page
protocol MHTabbarContainerViewControllerProtocol: class {
    func fetchMoreMovie(withPage page: Int)
}

///showing all movies data in table view
class MHTabbarContainerViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    //properties
    lazy var movies = [MHMovie]()
    var page = 1
    weak var delegate: MHTabbarContainerViewControllerProtocol?
    
    private let cellIdentifier = "TableViewContainerCell"
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? MHMovieDetailViewController {
            if let index = tableView.indexPathForSelectedRow?.row {
                vc.movie = movies[index]
            }
        }
    }
    
    //reload table view
    func reloadDataSource() {
        tableView.reloadData()
    }
}


// MARK: - UITableView datasource and delegate methods
extension MHTabbarContainerViewController: UITableViewDataSource, UITableViewDelegate {
    
    //UITableView datasource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MHContainerTableViewCell
        
        let dateFormat = MHTabBarViewController.dateFormat == .MDY ? kMMMDYYYY : kYYYYMMD
        cell.configureCell(with: movies[indexPath.row], andDateFormat: dateFormat)
        fetchMoreMovies(forIndexPath: indexPath)
        
        return cell ?? UITableViewCell()
    }
    
    //UITableView delegate method
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(kShowMovieDetailSegue, sender: nil)
    }
}

// MARK: - MHTabbarContainerViewController delegate method
private extension MHTabbarContainerViewController {
    
    func fetchMoreMovies(forIndexPath indexPath: NSIndexPath ) {
        if Double(page) == Double((indexPath.row + 1) / 20) {
            page += 1
            delegate?.fetchMoreMovie(withPage: page)
        }
    }
}






