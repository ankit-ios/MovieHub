//
//  MHDateFormatSettingViewController.swift
//  MovieHub
//
//  Created by Ankit Sharma on 01/02/17.
//  Copyright © 2017 Robosoft Technology. All rights reserved.
//

import UIKit

//This VC is handling date format setting
class MHDateFormatSettingViewController: UIViewController {

    //private constants
    private struct Constants {
        static let titleForSettingLabel = "Date format"
        static let titleForFirstRadioButton = "mmm - d - yyyy"
        static let titleForSecondRadioButton = "yyyy - mmm - d"
    }

    //properties
    private var dateFormat: MHDateFormat = .MDY

    
    //ViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormat = MHTabBarViewController.dateFormat
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? MHSettingContainerViewController {
            vc.dateFormatChangeDelegate = self
            vc.titleForSettingLabel = Constants.titleForSettingLabel
            vc.titleForFirstRadioButton = Constants.titleForFirstRadioButton
            vc.titleForSecondRadioButton = Constants.titleForSecondRadioButton
            vc.checkFirstRadioButtonSelected = MHTabBarViewController.dateFormat == .MDY
        }
    }
}

// MARK: - MHDateFormatChangeProtocol delegate method
extension MHDateFormatSettingViewController: MHDateFormatChangeProtocol {
   
    //date format changed
    func didChangeDateFormat(newFormat format: MHDateFormat) {
        MHTabBarViewController.dateFormat = format
        NSNotificationCenter.defaultCenter().postNotificationName(kDateFormatChangeNotification, object: nil)
    }
}
