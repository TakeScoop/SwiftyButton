//
//  SwiftyButton.swift
//  Scoop
//
//  Created by Loïs Di Qual on 11/15/15.
//  Copyright © 2015 Scoop. All rights reserved.
//

import Foundation

public struct SwiftyButtonDefaults {
    public static var buttonColor         = UIColor.cyanColor()
    public static var shadowColor         = UIColor.blueColor()
    public static var shadowHeight        = CGFloat(3)
    public static var cornerRadius        = CGFloat(3)
    public static var disabledButtonColor = UIColor.lightGrayColor()
    public static var disabledShadowColor = UIColor.darkGrayColor()
    public static var titleFont           = UIFont.systemFontOfSize(20)
    public static var buttonPressDepth    = CGFloat(0.7) // In percentage of shadowHeight
}

public class SwiftyButton: UIButton {
    
    public var buttonColor = SwiftyButtonDefaults.buttonColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    public var shadowColor = SwiftyButtonDefaults.shadowColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    public var shadowHeight = SwiftyButtonDefaults.shadowHeight {
        didSet {
            updateBackgroundImages()
            updateTitleInsets()
        }
    }
    
    public var cornerRadius = SwiftyButtonDefaults.cornerRadius {
        didSet {
            updateBackgroundImages()
        }
    }
    
    public var disabledButtonColor = SwiftyButtonDefaults.disabledButtonColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    public var disabledShadowColor = SwiftyButtonDefaults.disabledShadowColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    public var buttonPressDepth = SwiftyButtonDefaults.buttonPressDepth {
        didSet {
            updateBackgroundImages()
            updateTitleInsets()
        }
    }
    
    override public var highlighted: Bool {
		get {
            return super.highlighted
        }
        set {
            super.highlighted = newValue
            updateTitleInsets()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        updateBackgroundImages()
        updateTitleInsets()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        updateBackgroundImages()
        updateTitleInsets()
    }
    
    private func configure() {
        adjustsImageWhenDisabled    = false
        adjustsImageWhenHighlighted = false
    }
    
    private func updateTitleInsets() {
        let topPadding = highlighted ? shadowHeight * buttonPressDepth : 0
        let bottomPadding = highlighted ? shadowHeight * buttonPressDepth : shadowHeight
        titleEdgeInsets = UIEdgeInsets(top: topPadding, left: 0, bottom: bottomPadding, right: 0)
    }
    
    private func updateBackgroundImages() {
        
        let normalImage = SwiftyButton.buttonImageWithColor(buttonColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius)
        let highlightedImage = SwiftyButton.highlightedButtonImageWithColor(buttonColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, buttonPressDepth: buttonPressDepth)
        let disabledImage = SwiftyButton.buttonImageWithColor(disabledButtonColor, shadowHeight: shadowHeight, shadowColor: disabledShadowColor, cornerRadius: cornerRadius)
        
        setBackgroundImage(normalImage,      forState: .Normal)
        setBackgroundImage(highlightedImage, forState: .Highlighted)
        setBackgroundImage(disabledImage,    forState: .Disabled)
    }
}
