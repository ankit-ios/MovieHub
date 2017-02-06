//
//  MHMovieSortOrderSettingViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

//This VC is handling movie sort order setting
class MHMovieSortOrderSettingViewController: UIViewController {
    
    //private constants
    private struct Constants {
        static let titleForSettingLabel = "Sort by release date"
        static let titleForFirstRadioButton = "Ascending"
        static let titleForSecondRadioButton = "Descending"
    }
    
    //properties
    private var sortOrder: MHSortOrder = .Ascending
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sortOrder = MHTabBarViewController.sortOrder
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? MHSettingContainerViewController {
            vc.movieSortOrderDelegate = self
            vc.titleForSettingLabel = Constants.titleForSettingLabel
            vc.titleForFirstRadioButton = Constants.titleForFirstRadioButton
            vc.titleForSecondRadioButton = Constants.titleForSecondRadioButton
            vc.checkFirstRadioButtonSelected = MHTabBarViewController.sortOrder == .Ascending
        }
    }
}

// MARK: - MHMovieSortOrderChangeProtocol delegate method
extension MHMovieSortOrderSettingViewController: MHMovieSortOrderChangeProtocol {
    
    //movie sort order changed
    func didChangeMovieSortOrder(newOrder order: MHSortOrder) {
        MHTabBarViewController.sortOrder = order
        NSNotificationCenter.defaultCenter().postNotificationName(kMoviesSortNotification, object: nil)
    }
}
