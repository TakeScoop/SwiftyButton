//: Playground - noun: a place where people can play

@testable import SwiftyButton

let button = SwiftyButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
button.setTitle("Button", for: .normal)
button.setTitleColor(UIColor.white(), for: .normal)

button

button.buttonColor  = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
button.shadowColor  = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)


button.shadowHeight = 10

button.cornerRadius = 8

button.cornerRadius = 0

button.isHighlighted = true

button.buttonPressDepth = 0.5


button.disabledButtonColor = UIColor.gray()
button.disabledShadowColor = UIColor.darkGray()
button.isHighlighted = false
button.isEnabled = false

let flatButton = SwiftyButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
flatButton.setTitle("Flat Button", for: .normal)
flatButton.setTitleColor(UIColor.white(), for: .normal)
flatButton.buttonColor = UIColor.green()
flatButton.highlightedColor = UIColor.darkGray()
flatButton.shadowHeight = 0
flatButton

flatButton.isHighlighted = true
flatButton
