//: Playground - noun: a place where people can play

@testable import SwiftyButton

let button = SwiftyButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
button.setTitle("Button", forState: .Normal)
button.setTitleColor(UIColor.blackColor(), forState: .Normal)
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


let container = UIView(frame: CGRectMake(0, 0, 700, 50))
let leftButton = SwiftyButton(frame: CGRectMake(40, 0, 200, 50))
leftButton.setTitle("Button", forState: .Normal)
leftButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
leftButton.titleLabel!.font = UIFont.systemFontOfSize(18)
leftButton.buttonColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
leftButton.shadowColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
leftButton.shadowHeight = 3
leftButton.cornerRadius = 8
container.addSubview(leftButton)

let middleButton = SwiftyButton(frame: CGRectMake(250, 0, 200, 50))
middleButton.setTitle("Button", forState: .Normal)
middleButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
middleButton.titleLabel!.font = UIFont.systemFontOfSize(18)
middleButton.buttonColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)
middleButton.shadowColor = UIColor(red: 211/255, green: 84/255, blue: 0/255, alpha: 1)
middleButton.shadowHeight = 8
middleButton.cornerRadius = 4
container.addSubview(middleButton)

let rightButton = SwiftyButton(frame: CGRectMake(460, 0, 200, 50))
rightButton.setTitle("Button", forState: .Normal)
rightButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
rightButton.titleLabel!.font = UIFont.systemFontOfSize(18)
rightButton.buttonColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1)
rightButton.shadowColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
rightButton.shadowHeight = 12
rightButton.cornerRadius = 0
container.addSubview(rightButton)

container
