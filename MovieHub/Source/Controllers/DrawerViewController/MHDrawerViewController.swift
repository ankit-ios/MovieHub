//
//  MHDrawerViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

/// handle selection of drawer item
protocol MHDrawerViewControllerProtocol: class {
    func didSelectItem(withItem item: MHDrawerItem)
}

/// DrawerViewController
class MHDrawerViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    //properties
    weak var delegate: MHDrawerViewControllerProtocol?
    
    //private constants
    private struct Constants {
        static let dataSourceNames = ["Top Rated", "Popular", "Upcoming", "Setting"]
        static let dataSourceImageNames = ["topRated","popular","upcoming","setting"]
        static let cellIdentifier = "DrawerTableViewCell"
    }
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}

// MARK: - UITableView Datasource and delegate methods
extension MHDrawerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.dataSourceNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifier) as! MHDrawerTableViewCell
        cell.configureCell(withMovieType: Constants.dataSourceNames[indexPath.row], imageName: Constants.dataSourceImageNames[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectItem(withItem: MHDrawerItem.getItem(withValue: indexPath.row))
    }
}
