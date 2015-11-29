//
//  SwiftyCustomContentButton.swift
//  SwiftyButton
//
//  Created by Loïs Di Qual on 11/25/15.
//  Copyright © 2015 TakeScoop. All rights reserved.
//

import Foundation
import PureLayout

public class SwiftyCustomContentButton: SwiftyButton {
    
    public let customContentView = UIView()
    
    private var customContentViewTopConstraint:    NSLayoutConstraint?
    private var customContentViewBottomConstraint: NSLayoutConstraint?
    
    // @hack Intercept all touches on subviews
    public override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if let _ = super.hitTest(point, withEvent: event) {
            return self
        }
        return nil
    }
    
    override func updateTitleInsets() {
        super.updateTitleInsets()
        customContentViewTopConstraint?.constant = titleEdgeInsets.top
        customContentViewBottomConstraint?.constant = -titleEdgeInsets.bottom
    }
    
    override func configure() {
        super.configure()
        
        addSubview(customContentView)
        customContentViewTopConstraint    = customContentView.autoPinEdgeToSuperviewEdge(.Top)
        customContentViewBottomConstraint = customContentView.autoPinEdgeToSuperviewEdge(.Bottom)
        customContentView.autoPinEdgeToSuperviewEdge(.Left)
        customContentView.autoPinEdgeToSuperviewEdge(.Right)
    }
}