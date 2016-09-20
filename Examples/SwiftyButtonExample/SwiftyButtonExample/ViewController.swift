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
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        button.customContentView.addSubview(indicator)
        indicator.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0), excludingEdge: .right)
        indicator.startAnimating()
        
        let label = UILabel()
        button.customContentView.addSubview(label)
        label.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10), excludingEdge: .left)
        label.autoPinEdge(.left, to: .right, of: indicator, withOffset: 10)
        label.text = "Loading..."
        label.textColor = UIColor.white
        
        // Regression: Make sure that button with cornerRadius = 0 and shadowHeight = 0 doesn't crash
        // Was crashing in 0.3.1
        let zeroButton = SwiftyButton()
        zeroButton.shadowHeight = 0
        zeroButton.cornerRadius = 0
        zeroButton.highlightedColor = UIColor.blue
        view.addSubview(zeroButton)
        zeroButton.autoPinEdge(.top, to: .bottom, of: button, withOffset: 30)
        zeroButton.autoAlignAxis(toSuperviewAxis: .vertical)
        zeroButton.autoSetDimensions(to: CGSize(width: 200, height: 40))
        zeroButton.setTitle("Zero Button", for: .normal)
    }
}

