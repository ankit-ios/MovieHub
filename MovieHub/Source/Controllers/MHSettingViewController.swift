//
//  MHSettingViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 30/01/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

/// This VC is handling all setting(date format, movie sorting, theme color)
class MHSettingViewController: UIViewController {
    
    //private constants
    private struct Constants {
        static let cellIdentifier = "SettingTableViewCell"
        static let settingsTitle = ["Date format","Sort by release date", "Theme color"]
    }
    
    @IBOutlet private weak var settingTableView: UITableView!
    
    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - private extension of MHSettingVC
private extension MHSettingViewController {
    
    //initial setup for VC
    func initialSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(leftBarButtonAction))
        settingTableView.tableFooterView = UIView()
    }
    
    @objc func leftBarButtonAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // show color picker from UIButton
     func showColorPicker() {
        
        let colorPickerVc = UIViewController.colorPickerController() as! MHColorPickerViewController
        
        colorPickerVc.modalTransitionStyle = .CrossDissolve
        colorPickerVc.modalPresentationStyle = .OverCurrentContext
        colorPickerVc.colorPickerDelegate = self
        
        presentViewController(colorPickerVc, animated: true, completion: nil)
    }
}

// MARK: - UITableView datasource and delegate methods
extension MHSettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.settingsTitle.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifier) as! MHSettingTableViewCell
        cell.configureCell(withSettingTitle: Constants.settingsTitle[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            performSegueWithIdentifier(kDateFormatSettingSegue, sender: nil)
        } else if indexPath.row == 1 {
            performSegueWithIdentifier(kReleaseDateSettingSegue, sender: nil)
        } else {
            showColorPicker()
        }
    }
}

// MARK: MHColorPickerDelegate methods
extension MHSettingViewController: MHColorPickerDelegate{
    // called by color picker after color selected.
    func colorPickerDidColorSelected(selectedUIColor selectedUIColor: UIColor, selectedHexColor: String) {
        
        // update color value 
        MHNavigationController.themeColor = selectedUIColor
        MHTabBarViewController.themeColor = selectedUIColor
        NSNotificationCenter.defaultCenter().postNotificationName(kThemeColorChangeNotification, object: nil)
    }
    
}