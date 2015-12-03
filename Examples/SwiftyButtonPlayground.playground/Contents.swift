//: Playground - noun: a place where people can play

@testable import SwiftyButton

let button = SwiftyButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
button.setTitle("Button", forState: .Normal)
button.setTitleColor(UIColor.whiteColor(), forState: .Normal)

button

button.buttonColor  = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
button.shadowColor  = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)


button.shadowHeight = 10

button.cornerRadius = 8

button.cornerRadius = 0

button.highlighted = true

button.buttonPressDepth = 0.5


button.disabledButtonColor = UIColor.grayColor()
button.disabledShadowColor = UIColor.darkGrayColor()
button.highlighted = false
button.enabled = false

let flatButton = SwiftyButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
flatButton.setTitle("Flat Button", forState: .Normal)
flatButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
flatButton.buttonColor = UIColor.greenColor()
flatButton.highlightedColor = UIColor.darkGrayColor()
flatButton.shadowHeight = 0
flatButton

flatButton.highlighted = true
flatButton
