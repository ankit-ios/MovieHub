//
//  MHTabbarBaseViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 31/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit
import MBProgressHUD

/** This VC is a base viewcontroller for MHTopRatedVC, MHPopluarVC, MHUpcomingVC. this is handling all activity which will happen on sub VCs, this VC handle notification observer, fetching movies details from APIs, Sorting in movies, changing date format(app setting), reloading data source.
 */
class MHTabbarBaseViewController: UIViewController {
    
    //properties
    lazy var movies = [MHMovie]()
    var movieURLString: String!
    var page = 1
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addObserver()
        fetchDataSourceFromServer()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? MHTabbarContainerViewController {
            vc.movies = self.movies
            vc.page = page
            vc.delegate = self
        }
    }
    
    deinit {
        NSNotification.removeObserver(name: kDateFormatChangeNotification)
    }
}

// MARK: - Private Extension
private extension MHTabbarBaseViewController {
    
    //fetch data from server
    func fetchDataSourceFromServer() {
        MBProgressHUD.showHUD(forView: self.view)
        
        MHWebServiceManager.getMovieDetail(with: MHMovieDBAPI.getMoviesURL(string: movieURLString, withPage: page)) { [weak self] response, error in
            print(self?.movieURLString)
            
            if let response = response where error == nil {
                self?.movies.appendContentsOf(response)
                self?.reloadTableView(withMovie: response)
            } else {
                MBProgressHUD.hideHUD(forView: self?.view ?? UIView())
                self?.showAlertWithMessage(title: kError, message: error?.localizedDescription, viewController: self)
            }
        }
    }
    
    //initial setup for VC
    func initialSetup() {
        self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
    }
    
    //adding Observer for handle app setting
    func addObserver() {
        NSNotification.addObserver(observer: self, selector: #selector(handleDateFormatChangeNotification), name: kDateFormatChangeNotification)
        NSNotification.addObserver(observer: self, selector: #selector(handleMoviesSortNotification), name: kMoviesSortNotification)
    }
    
    //handle movies sorting
    func getSortedMovies(orderAscending ascending: Bool) -> [MHMovie] {
        let order = ascending ? NSComparisonResult.OrderedAscending : NSComparisonResult.OrderedDescending
        
        let newSortedMovies = movies.sort { (firstMovie, secondMovie) -> Bool in
            if let firstMovieReleaseDate = firstMovie.movieReleaseDate, let secondMovieReleaseDate = secondMovie.movieReleaseDate {
                if let firstDate = NSDateFormatter.dateWithDateFormatter(forString: firstMovieReleaseDate), let secondDate = NSDateFormatter.dateWithDateFormatter(forString: secondMovieReleaseDate) {
                    return firstDate.compare(secondDate) == order
                }
                return false
            }
            return false
        }
        return newSortedMovies
    }
    
    //reloading dataSource
    func reloadTableView(withMovie movies: [MHMovie]) {
        dispatch_async(dispatch_get_main_queue(), {
            MBProgressHUD.hideHUD(forView: self.view)
            if let vc = self.childViewControllers[0] as? MHTabbarContainerViewController {
                vc.movies.appendContentsOf(movies)
                vc.reloadDataSource()
            }
        })
    }
}

// MARK: - Extension MHTabbarBaseViewController, handling all notifications
extension MHTabbarBaseViewController {
    
    func handleDateFormatChangeNotification()  {
        reloadTableView(withMovie: self.movies)
    }
    
    func handleMoviesSortNotification() {
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            let sortedMovies = self.getSortedMovies(orderAscending: MHTabBarViewController.sortOrder == .Ascending)
            
            dispatch_async(dispatch_get_main_queue(), {
                MBProgressHUD.hideHUD(forView: self.view)
                if let vc = self.childViewControllers[0] as? MHTabbarContainerViewController {
                    vc.movies = sortedMovies
                    vc.reloadDataSource()
                }
            })
        }
    }
}

// MARK: - MHTabbarContainerViewControllerProtocol delegate method
extension MHTabbarBaseViewController: MHTabbarContainerViewControllerProtocol {
    
    func fetchMoreMovie(withPage page: Int) {
        self.page = page
        fetchDataSourceFromServer()
    }
}
