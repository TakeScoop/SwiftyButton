//
//  SwiftyButton.swift
//  Scoop
//
//  Created by Loïs Di Qual on 11/15/15.
//  Copyright © 2015 Scoop. All rights reserved.
//

import UIKit

// MARK: - Defaults

public struct SwiftyButtonDefaults {
    public static var buttonColor         = UIColor.cyanColor()
    public static var highlightedColor    = UIColor.cyanColor()
    public static var shadowColor         = UIColor.blueColor()
    public static var shadowHeight        = CGFloat(3)
    public static var cornerRadius        = CGFloat(3)
    public static var disabledButtonColor = UIColor.lightGrayColor()
    public static var disabledShadowColor = UIColor.darkGrayColor()
    public static var titleFont           = UIFont.systemFontOfSize(20)
    public static var buttonPressDepth    = CGFloat(0.7) // In percentage of shadowHeight
}

@IBDesignable
public class SwiftyButton: UIButton {
    
    // MARK: - Public properties
    
    @IBInspectable public var buttonColor: UIColor = SwiftyButtonDefaults.buttonColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var highlightedColor: UIColor = SwiftyButtonDefaults.highlightedColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = SwiftyButtonDefaults.shadowColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var shadowHeight: CGFloat = SwiftyButtonDefaults.shadowHeight {
        didSet {
            updateBackgroundImages()
            updateTitleInsets()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = SwiftyButtonDefaults.cornerRadius {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var disabledButtonColor: UIColor = SwiftyButtonDefaults.disabledButtonColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var disabledShadowColor: UIColor = SwiftyButtonDefaults.disabledShadowColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var buttonPressDepth: CGFloat = SwiftyButtonDefaults.buttonPressDepth {
        didSet {
            updateBackgroundImages()
            updateTitleInsets()
        }
    }
    
    // MARK: - Style
    
    public enum Style {
        
        /**
         Flat button (no 3D effect) that changes color on touch.
         Using this style will set shadowHeight = 0 and shadowColor = UIColor.clearColor().
         
         - parameter buttonColor:      Button color in the normal state
         - parameter highlightedColor: Button color in the highlighted state
         */
        case Flat(buttonColor: UIColor, highlightedColor: UIColor)
        
        /**
         Pressable (3D) button that moves on press.
         Using this style will set highlightedColor = buttonColor, and the default shadowHeight will be used.
         
         - parameter buttonColor: Button color in the normal state
         - parameter shadowColor: Shadow color of the button
         */
        case Pressable(buttonColor: UIColor, shadowColor: UIColor)
    }
    
    // Note: there is no way to "get" the button style after calling `updateWithStyle`, because all properties
    // can be changed at any time, making the style concept mutable.
    public func updateWithStyle(style: Style) {
        switch style {
        case .Flat(let buttonColor, let highlightedColor):
            self.buttonColor      = buttonColor
            self.highlightedColor = highlightedColor
            self.shadowColor      = .clearColor()
            self.shadowHeight     = 0
            break
        case .Pressable(let buttonColor, let shadowColor):
            self.buttonColor      = buttonColor
            self.highlightedColor = buttonColor
            self.shadowColor      = shadowColor
            self.shadowHeight     = SwiftyButtonDefaults.shadowHeight
        }
    }
    
    // MARK: - UIButton
    
    override public var highlighted: Bool {
		get {
            return super.highlighted
        }
        set {
            super.highlighted = newValue
            updateTitleInsets()
        }
    }
    
    public convenience init(style: Style) {
        self.init()
        updateWithStyle(style)
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
    
    // MARK: - Internal methods
    
    func configure() {
        adjustsImageWhenDisabled    = false
        adjustsImageWhenHighlighted = false
    }
    
    func updateTitleInsets() {
        let topPadding = highlighted ? shadowHeight * buttonPressDepth : 0
        let bottomPadding = highlighted ? shadowHeight * (1 - buttonPressDepth) : shadowHeight
        titleEdgeInsets = UIEdgeInsets(top: topPadding, left: 0, bottom: bottomPadding, right: 0)
    }
    
    func updateBackgroundImages() {
        
        let normalImage = SwiftyButton.buttonImageWithColor(buttonColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius)
        let highlightedImage = SwiftyButton.highlightedButtonImageWithColor(highlightedColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, buttonPressDepth: buttonPressDepth)
        let disabledImage = SwiftyButton.buttonImageWithColor(disabledButtonColor, shadowHeight: shadowHeight, shadowColor: disabledShadowColor, cornerRadius: cornerRadius)
        
        setBackgroundImage(normalImage,      forState: .Normal)
        setBackgroundImage(highlightedImage, forState: .Highlighted)
        setBackgroundImage(disabledImage,    forState: .Disabled)
    }
}
