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
        
        let buttonColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
        let shadowColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        
        let button = SwiftyCustomContentButton(style: .Pressable(buttonColor: buttonColor, shadowColor: shadowColor))
        customButtonContainerView.addSubview(button)
        button.autoPinEdgesToSuperviewEdges()
        
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
    }
}

