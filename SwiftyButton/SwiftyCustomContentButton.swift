//
//  SwiftyCustomContentButton.swift
//  SwiftyButton
//
//  Created by Loïs Di Qual on 11/25/15.
//  Copyright © 2015 TakeScoop. All rights reserved.
//

import Foundation
import PureLayout

open class SwiftyCustomContentButton: SwiftyButton {
    
    public let customContentView = UIView()
    
    private var customContentViewTopConstraint:    NSLayoutConstraint?
    private var customContentViewBottomConstraint: NSLayoutConstraint?
    
    // @hack Intercept all touches on subviews
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let _ = super.hitTest(point, with: event) {
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
        customContentViewTopConstraint = customContentView.autoPinEdge(toSuperviewEdge: .top)
        customContentViewBottomConstraint = customContentView.autoPinEdge(toSuperviewEdge: .bottom)
        customContentView.autoPinEdge(toSuperviewEdge: .left)
        customContentView.autoPinEdge(toSuperviewEdge: .right)
    }
}
