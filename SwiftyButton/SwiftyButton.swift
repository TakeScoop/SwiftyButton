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
    public static var buttonColor         = UIColor.cyan
    public static var shadowColor         = UIColor.blue
    public static var shadowHeight        = CGFloat(3)
    public static var cornerRadius        = CGFloat(3)
    public static var disabledButtonColor = UIColor.lightGray
    public static var disabledShadowColor = UIColor.darkGray
    public static var titleFont           = UIFont.systemFont(ofSize: 20)
    public static var buttonPressDepth    = CGFloat(0.7) // In percentage of shadowHeight
    
    public static var highlightedColor: UIColor? = nil
}

@IBDesignable
open class SwiftyButton: UIButton {
    
    // MARK: - Public properties
    
    @IBInspectable public var buttonColor: UIColor = SwiftyButtonDefaults.buttonColor {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable public var highlightedColor: UIColor? = SwiftyButtonDefaults.highlightedColor {
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
    
    // MARK: - UIButton
    
    override open var isHighlighted: Bool {
		get {
            return super.isHighlighted
        }
        set {
            super.isHighlighted = newValue
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
    
    // MARK: - Internal methods
    
    func configure() {
        adjustsImageWhenDisabled    = false
        adjustsImageWhenHighlighted = false
    }
    
    func updateTitleInsets() {
        let topPadding = isHighlighted ? shadowHeight * buttonPressDepth : 0
        let bottomPadding = isHighlighted ? shadowHeight * (1 - buttonPressDepth) : shadowHeight
        titleEdgeInsets = UIEdgeInsets(top: topPadding, left: 0, bottom: bottomPadding, right: 0)
    }
    
    func updateBackgroundImages() {
        
        let normalImage = SwiftyButton.buttonImage(color: buttonColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius)
        let highlightedImage = SwiftyButton.highlightedButtonImage(color: highlightedColor ?? buttonColor, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, buttonPressDepth: buttonPressDepth)
        let disabledImage = SwiftyButton.buttonImage(color: disabledButtonColor, shadowHeight: shadowHeight, shadowColor: disabledShadowColor, cornerRadius: cornerRadius)
        
        setBackgroundImage(normalImage,      for: .normal)
        setBackgroundImage(highlightedImage, for: .highlighted)
        setBackgroundImage(disabledImage,    for: .disabled)
    }
}
