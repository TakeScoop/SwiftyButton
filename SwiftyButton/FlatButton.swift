//
//  FlatButton.swift
//  SwiftyButton
//
//  Created by Lois Di Qual on 10/23/16.
//  Copyright © 2016 TakeScoop. All rights reserved.
//

import UIKit

@IBDesignable
open class FlatButton: UIButton {
    
    public enum Defaults {
        public static var color = UIColor(red: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)
        public static var highlightedColor =  UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)
        public static var selectedColor =  UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)
        public static var disabledColor = UIColor(red: 149 / 255, green: 165 / 255, blue: 166 / 255, alpha: 1)
        public static var cornerRadius: CGFloat = 3
    }
    
    @IBInspectable
    public var color: UIColor = Defaults.color {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var highlightedColor: UIColor = Defaults.highlightedColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var selectedColor: UIColor = Defaults.selectedColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var disabledColor: UIColor = Defaults.disabledColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = Defaults.cornerRadius {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - UIButton
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        updateBackgroundImages()
        super.draw(rect)
    }
    
    // MARK: - Internal methods
    
    fileprivate func configure() {
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    fileprivate func updateBackgroundImages() {
        
        let normalImage = Utils.buttonImage(color: color, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        let highlightedImage = Utils.highlightedButtonImage(color: highlightedColor, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius, buttonPressDepth: 0)
        let selectedImage = Utils.buttonImage(color: selectedColor, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        let disabledImage = Utils.buttonImage(color: disabledColor, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        
        setBackgroundImage(normalImage, for: .normal)
        setBackgroundImage(highlightedImage, for: .highlighted)
        setBackgroundImage(selectedImage, for: .selected)
        setBackgroundImage(disabledImage, for: .disabled)
    }
}
