SwiftyButton
============

Simple and customizable button in Swift.

![](Examples/demo.gif)

Installation
------------

```
pod 'SwiftyButton'
```

Usage
-----

### Flat Button

![](Examples/flat-button.gif)

```swift
let button = FlatButton()
button.color = .cyan
button.highlightedColor = .blue
button.cornerRadius  = 5
```

### Pressable Button

![](Examples/pressable-button.gif)

```swift
let button = PressableButton()
button.colors = .init(button: .cyan, shadow: .blue)
button.shadowHeight = 5
button.cornerRadius = 5
```

### All Properties

Here is a list of all the properties that you can modify. Those are all editable directly from Interface Builder. See `FlatButton.Defaults` or `PressableButton.Defaults` to set defaults for those properties.

#### `FlatButton`

```swift
button.color = .cyan
button.highlightedColor = .cyan
button.disabledButtonColor = .gray
button.cornerRadius = 8
```

#### `PressableButton`

```swift
button.colors = .init(button: .cyan, shadow: .blue)
button.disabledColors = .init(button: .gray, shadow: .darkGray)
button.shadowHeight = 10
button.cornerRadius = 8
button.depth = 0.5 // In percentage of shadowHeight
```

### Interface Builder (Storyboard/XIB)

Add a `UIButton` as usual, modify the underlying class to `FlatButton`, and make sure that the button type is set to `Custom`:

<img src="https://www.dropbox.com/s/krkj3klxcfxjsjf/Screenshot%202015-11-16%2015.35.59.png?raw=1" width="30%" style="vertical-align:top">
<img src="https://www.dropbox.com/s/4xtllxwjpqy3uia/Screenshot%202015-11-16%2015.33.45.png?raw=1" width="30%" style="vertical-align:top">
<img src="https://www.dropbox.com/s/2q78xgbh4rspv4b/Screenshot%202015-11-28%2022.00.21.png?raw=1" width="30%" style="vertical-align:top">


Defaults
--------

You can set defaults that will be applied for any new instance of SwiftyButton by modifying the `FlatButton.Defaults` or `PressableButton.Defaults` structure:

```swift
FlatButton.Defaults.color = .cyan
PressableButton.Defaults.cornerRadius = 8
...
```

Custom Content
--------------

![](Examples/custom.gif)

Use `CustomPressableButton` to add custom content in a Swifty Button.

This is a subclass of `SwiftyButton` that exposes a content view that moves when the button state changes. All you have to do is add your views inside `button.contentView` and setup layout constraints relative to this view.

### Install

```
pod `SwiftyButton/CustomContent`
```

### Usage

Here is how you would create a button similar to the one above (here we used [PureLayout](https://github.com/PureLayout/PureLayout) for constraints):

```swift
let button = CustomPressableButton()

let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
button.contentView.addSubview(indicator)
indicator.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0), excludingEdge: .right)
indicator.startAnimating()

let label = UILabel()
button.contentView.addSubview(label)
label.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10), excludingEdge: .left)
label.autoPinEdge(.left, to: .right, of: indicator, withOffset: 10)
label.text = "Loading..."
label.textColor = .white
``` 

More examples
-------------

Look at the [Examples](Examples/) folder to see more button examples.

License
-------

This project is copyrighted under the MIT license. Complete license can be found here: <https://github.com/TakeScoop/SwiftyButton/blob/master/LICENSE>

Credits
-------

 - Inspired by HTPressableButton: <https://github.com/herinkc/HTPressableButton>
 - Colors used in examples come from <https://flatuicolors.com/>

