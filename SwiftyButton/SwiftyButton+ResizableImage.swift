//
//  SwiftyButton+ResizableImage.swift
//  Scoop
//
//  Created by Loïs Di Qual on 11/15/15.
//  Copyright © 2015 Scoop. All rights reserved.
//

import UIKit

extension SwiftyButton {
    
    class func buttonImageWithColor(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat) -> UIImage {
        
        return buttonImageWithColor(color, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, frontImageOffset: 0)
    }
    
    class func highlightedButtonImageWithColor(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat,
        buttonPressDepth: CGFloat) -> UIImage {
        
        return buttonImageWithColor(color, shadowHeight: shadowHeight, shadowColor: shadowColor, cornerRadius: cornerRadius, frontImageOffset: shadowHeight * buttonPressDepth)
    }
    
    private class func buttonImageWithColor(
        color: UIColor,
        shadowHeight: CGFloat,
        shadowColor: UIColor,
        cornerRadius: CGFloat,
        frontImageOffset: CGFloat) -> UIImage {
        
        // Create foreground and background images
        let width      = max(1, cornerRadius * 2 + shadowHeight)
        let height     = max(1, cornerRadius * 2 + shadowHeight)
        let size       = CGSize(width: width, height: height)
            
        let frontImage = imageWithColor(color, size: size, cornerRadius: cornerRadius)
        var backImage: UIImage? = nil
        if shadowHeight != 0 {
            backImage = imageWithColor(shadowColor, size: size, cornerRadius: cornerRadius)
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height + shadowHeight)
        
        // Draw background image then foreground image
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage?.drawAtPoint(CGPoint(x: 0, y: shadowHeight))
        frontImage.drawAtPoint(CGPoint(x: 0, y: frontImageOffset))
        let nonResizableImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Create resizable image
        let capInsets = UIEdgeInsets(top: cornerRadius + frontImageOffset, left: cornerRadius, bottom: cornerRadius + shadowHeight - frontImageOffset, right: cornerRadius)
        let resizableImage = nonResizableImage.resizableImageWithCapInsets(capInsets, resizingMode: .Stretch)
            
        return resizableImage
    }
    
    private class func imageWithColor(color: UIColor, size: CGSize, cornerRadius: CGFloat) -> UIImage {
        
        let rect = CGRect(origin: CGPointMake(0, 0), size: size)
        
        // Create a non-rounded image
    	UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let nonRoundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Clip it with a bezier path
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: cornerRadius
        ).addClip()
        nonRoundedImage.drawInRect(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
