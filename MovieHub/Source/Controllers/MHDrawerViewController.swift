//
//  MHDrawerViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 29/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

class MHDrawerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let dataSourceNames = ["Top Rated", "Popular", "Upcoming", "Setting"]
    let dataSourceImageNames = ["topRated","popular","upcoming","setting"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}

extension MHDrawerViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DrawerTableViewCell") as! MHDrawerTableViewCell
        cell.configureCell(withMovieType: dataSourceNames[indexPath.row], imageName: dataSourceImageNames[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}
