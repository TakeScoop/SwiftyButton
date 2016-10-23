//
//  CustomPressableButton.swift
//  SwiftyButton
//
//  Created by Loïs Di Qual on 11/25/15.
//  Copyright © 2015 TakeScoop. All rights reserved.
//

import Foundation

open class CustomPressableButton: PressableButton {
    
    public let contentView = UIView()
    
    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    public override var cornerRadius: CGFloat {
        didSet {
            contentView.layer.cornerRadius = cornerRadius
        }
    }
    
    // @hack Intercept all touches on subviews
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let _ = super.hitTest(point, with: event) {
            return self
        }
        return nil
    }
    
    override func updateTitleInsets() {
        super.updateTitleInsets()
        topConstraint?.constant = titleEdgeInsets.top
        bottomConstraint?.constant = titleEdgeInsets.bottom
    }
    
    override func configure() {
        super.configure()
        
        contentView.layer.masksToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView]|", options: [], metrics: nil, views: ["contentView": contentView])
        topConstraint = verticalConstraints[0]
        bottomConstraint = verticalConstraints[1]
        addConstraints(verticalConstraints)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView]|", options: [], metrics: nil, views: ["contentView": contentView]))
    }
}
