//
//  MHSettingContainerViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

//handle, when date format changed
protocol MHDateFormatChangeProtocol: class {
    func didChangeDateFormat(newFormat format: MHDateFormat)
}

//handle, when movie sort order changed
protocol MHMovieSortOrderChangeProtocol: class {
    func didChangeMovieSortOrder(newOrder order: MHSortOrder)
}

/// This VC is handling setting of app
class MHSettingContainerViewController: UIViewController {
    
    @IBOutlet private weak var settingTitleLabel: UILabel!
    @IBOutlet private weak var firstRadioButton: UIButton!
    @IBOutlet private weak var secondRadioButton: UIButton!
    
    //properties
    var titleForSettingLabel: String! //implicit unwrapped
    var titleForFirstRadioButton: String!
    var titleForSecondRadioButton: String!
    var checkFirstRadioButtonSelected: Bool!
    
    //delegates
    weak var dateFormatChangeDelegate: MHDateFormatChangeProtocol?
    weak var movieSortOrderDelegate: MHMovieSortOrderChangeProtocol?
    
    //private properties
    private let firstRadioButtonTag = 1
    private let secondRadioButtonTag = 2

    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //action methods
    @IBAction func didTapRadioButton(sender: UIButton) {
        switch sender.tag {
        case firstRadioButtonTag:
            updateRadioButtonUI(true)
        case secondRadioButtonTag:
            updateRadioButtonUI(false)
        default:
            return
        }
    }
        
    @IBAction func didTapCancelButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapOkButton(sender: UIButton) {
        dateFormatChangeDelegate?.didChangeDateFormat(newFormat: firstRadioButton.selected ? .MDY : .YMD)
        movieSortOrderDelegate?.didChangeMovieSortOrder(newOrder: firstRadioButton.selected ? .Ascending : .Descending)
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// MARK: - Private Extension
private extension MHSettingContainerViewController {
    
    //initial setup for VC
    func initialSetup() {
        settingTitleLabel.text = titleForSettingLabel
        firstRadioButton.setTitle(titleForFirstRadioButton, forState: .Normal)
        secondRadioButton.setTitle(titleForSecondRadioButton, forState: .Normal)
        
        updateRadioButtonUI(checkFirstRadioButtonSelected)
    }
    
    //radio button update
    func updateRadioButtonUI(aFlag: Bool) {
        firstRadioButton.selected = aFlag
        secondRadioButton.selected = !aFlag
    }
}


