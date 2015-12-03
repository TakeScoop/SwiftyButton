//
//  ViewController.swift
//  SwiftyButtonExample
//
//  Created by Loïs Di Qual on 11/27/15.
//  Copyright © 2015 TakeScoop. All rights reserved.
//

import UIKit
import SwiftyButton

class ViewController: UIViewController {

    @IBOutlet weak var customButtonContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = SwiftyCustomContentButton()
        customButtonContainerView.addSubview(button)
        button.autoPinEdgesToSuperviewEdges()
        button.buttonColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
        button.shadowColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
        button.customContentView.addSubview(indicator)
        indicator.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0), excludingEdge: .Right)
        indicator.startAnimating()
        
        let label = UILabel()
        button.customContentView.addSubview(label)
        label.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10), excludingEdge: .Left)
        label.autoPinEdge(.Left, toEdge: .Right, ofView: indicator, withOffset: 10)
        label.text = "Loading..."
        label.textColor = UIColor.whiteColor()
        
        // Regression: Make sure that button with cornerRadius = 0 and shadowHeight = 0 doesn't crash
        // Was crashing in 0.3.1
        let zeroButton = SwiftyButton()
        zeroButton.shadowHeight = 0
        zeroButton.cornerRadius = 0
        zeroButton.highlightedColor = UIColor.blueColor()
        view.addSubview(zeroButton)
        zeroButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: button, withOffset: 30)
        zeroButton.autoAlignAxisToSuperviewAxis(.Vertical)
        zeroButton.autoSetDimensionsToSize(CGSizeMake(200, 40))
        zeroButton.setTitle("Zero Button", forState: .Normal)
    }
}

