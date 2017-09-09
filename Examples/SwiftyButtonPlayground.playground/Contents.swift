@testable import SwiftyButton

let button = PressableButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
button.setTitle("Button", for: .normal)
button.setTitleColor(.white, for: .normal)

button.colors = PressableButton.ColorSet(
    button: UIColor(red: 230 / 255, green: 126 / 255, blue: 34 / 255, alpha: 1),
    shadow: UIColor(red: 211 / 255, green: 84 / 255, blue: 0, alpha: 1)
)

button.shadowHeight = 10

button.cornerRadius = 8

button.cornerRadius = 0

button.isHighlighted = true

button.depth = 0.5

button.setTitleColor(.black, for: .disabled)
button.disabledColors = PressableButton.ColorSet(
    button: UIColor(red: 236 / 255, green: 240 / 255, blue: 241 / 255, alpha: 1),
    shadow: UIColor(red: 189 / 255, green: 195 / 255, blue: 199 / 255, alpha: 1)
)
button.isHighlighted = false
button.isEnabled = false

let flatButton = FlatButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
flatButton.setTitle("Flat Button", for: .normal)
flatButton.setTitleColor(.white, for: .normal)
flatButton.color = UIColor(red: 230 / 255, green: 126 / 255, blue: 34 / 255, alpha: 1)
flatButton.selectedColor = UIColor(red: 231 / 255, green: 60 / 255, blue: 0, alpha: 1)
flatButton.highlightedColor = UIColor(red: 211 / 255, green: 84 / 255, blue: 0, alpha: 1)

flatButton.isHighlighted = true

flatButton.isHighlighted = false
flatButton.isSelected = true
