//
//  Utils.swift
//  Scoop
//
//  Created by Loïs Di Qual on 11/15/15.
//  Copyright © 2015 Scoop. All rights reserved.
//

import UIKit

enum Utils {
    
    static func buttonImage(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat) -> UIImage {
        
        return buttonImage(color: color, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, frontImageOffset: 0)
    }
    
    static func highlightedButtonImage(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat,
        buttonPressDepth: Double) -> UIImage {
        
        return buttonImage(color: color, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, frontImageOffset: shadowHeight * CGFloat(buttonPressDepth))
    }
    
    static func buttonImage(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat,
        frontImageOffset: CGFloat) -> UIImage {
        
        // Create foreground and background images
        let width = max(1, cornerRadius * 2 + shadowHeight)
        let height = max(1, cornerRadius * 2 + shadowHeight)
        let size = CGSize(width: width, height: height)
            
        let frontImage = image(color: color, size: size, cornerRadius: cornerRadius)
        var backImage: UIImage? = nil
        if shadowHeight != 0 {
            backImage = image(color: shadowColor, size: size, cornerRadius: cornerRadius)
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height + shadowHeight)
        
        // Draw background image then foreground image
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage?.draw(at: CGPoint(x: 0, y: shadowHeight))
        frontImage.draw(at: CGPoint(x: 0, y: frontImageOffset))
        let nonResizableImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Create resizable image
        let capInsets = UIEdgeInsets(top: cornerRadius + frontImageOffset, left: cornerRadius, bottom: cornerRadius + shadowHeight - frontImageOffset, right: cornerRadius)
        let resizableImage = nonResizableImage?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch)
            
        return resizableImage ?? UIImage()
    }
    
    static func image(color: UIColor, size: CGSize, cornerRadius: CGFloat) -> UIImage {
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        // Create a non-rounded image
    	UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let nonRoundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Clip it with a bezier path
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: cornerRadius
        ).addClip()
        nonRoundedImage?.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
}
