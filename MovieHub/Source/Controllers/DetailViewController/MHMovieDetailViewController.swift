//
//  MHMovieDetailViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 31/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit
import MBProgressHUD

//This is responsible for displaying movie details
class MHMovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var movieOverviewLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    //properties
    var movie: MHMovie?
    private lazy var moviePosterArray = [MHMoviePoster]()
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        fetchPosterFromServer()
    }
    
    //handle collection view layout when orientation changed
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
}

// MARK: - Private Extension
private extension MHMovieDetailViewController {
    
    //initial setup for VC
    func initialSetup() {
        if let movie = movie {
            movieOverviewLabel.text = movie.movieOverview
            title = movie.movieTitle
        }
        configurePageControl()
        configureBarButton()
    }
    
    //configure page control
    func configurePageControl() {
        pageControl.numberOfPages = moviePosterArray.count
        pageControl.transform = CGAffineTransformMakeScale(0.7, 0.7)
        pageControl.currentPage = 0
    }
    
    //configure share button
    func configureBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .Plain, target: self, action: #selector(shareButtonAction))
    }
    
    //fetch details of movie from server
    func fetchPosterFromServer() {
        if let movie = movie {
            let urlString = MHMovieDBAPI.getImageArrayURLString(withMovieID: "\(movie.movieID ?? 0)")
            MBProgressHUD.showHUD(forView: view)
            
            MHWebServiceManager.getMoviePosters(with: urlString) { [weak self] (response, error) in
                MBProgressHUD.hideHUD(forView: self?.view ?? UIView())
                
                if let response = response where error == nil {
                    self?.moviePosterArray = response
                    self?.pageControl.numberOfPages = response.count
                    self?.collectionView.reloadData()
                } else {
                    self?.showAlertWithMessage(title: kError, message: error?.localizedDescription, viewController: self)
                }
            }
        }
    }
    
    //share button handling
    @objc func shareButtonAction(sender: AnyObject) {
        if let movie = movie {
            let textToShare = "\(movie.movieTitle ?? "") - \(movie.movieVoteAverage ?? 0) # \(UITabBarController.getTitle(forSelectedIndex: tabBarController?.selectedIndex ?? 0))" // share format (movie title - movie rating # Top Rated)
            
            let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    func configureCell(withIndePath indexPath: NSIndexPath) -> MHMovieDetailCollectionViewCell {
        pageControl.currentPage = indexPath.row
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieDetailCell", forIndexPath: indexPath) as! MHMovieDetailCollectionViewCell
        if let moviePoster = moviePosterArray[indexPath.row].moviePoster {
            cell.setImage(withImage: UIImage(named: "placeholder")!)
            MBProgressHUD.showHUD(forView: cell)
            
            let urlString = MHMovieDBAPI.getImageURLString(withImageName: moviePoster)
            
            //check image is in cache or not
            if let image = NSCache.sharedInstance.objectForKey(urlString) as? UIImage {
                MBProgressHUD.hideHUD(forView: cell)
                cell.setImage(withImage: image)
            } else {
                
                //download image from server
                MHWebServiceManager.getImage(with: urlString, onCompletion: { [weak self] (image, error) in
                    if let image = image where error == nil {
                        dispatch_async(dispatch_get_main_queue(), {
                            MBProgressHUD.hideHUD(forView: cell)
                            cell.setImage(withImage: image)
                            NSCache.sharedInstance.setObject(image, forKey: urlString)
                        })
                    } else {
                        MBProgressHUD.hideHUD(forView: cell)
                        self?.showAlertWithMessage(title: kError, message: error?.localizedDescription, viewController: self)
                    }
                    })
            }
        }
        return cell
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate methods
extension MHMovieDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviePosterArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return configureCell(withIndePath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout methods
extension MHMovieDetailViewController: UICollectionViewDelegateFlowLayout {
    
    //size of cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 2)
    }
    
    //minimum spacing between cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
