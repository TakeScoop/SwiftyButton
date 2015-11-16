SwiftyButton
============

Simple and customizable button in Swift

![](https://www.dropbox.com/s/mcr0b1vkhm4hlz3/Screenshot%202015-11-16%2015.29.31.png?raw=1)

Installation
------------

```
pod 'SwiftyButton', :git => 'git@github.com:TakeScoop/SwiftyButton.git'
```

Usage
-----

### From code

```
let button = SwiftyButton()
button.setTitle("Button", forState: .Normal)

button.buttonColor = UIColor.cyanColor()
button.shadowColor = UIColor.blueColor()
button.disabledButtonColor = UIColor.grayColor()
button.disabledShadowColor = UIColor.darkGrayColor()
button.shadowHeight = 10
button.cornerRadius = 8
button.highlighted = true
button.buttonPressDepth = 0.5 // In percentage of shadowHeight
```

### From a storyboard

Add a `UIButton` as usual, and modify the underlying class to `SwiftyButton`:

![](https://www.dropbox.com/s/krkj3klxcfxjsjf/Screenshot%202015-11-16%2015.35.59.png?raw=1)

Also make sure that the button type is set to custom:

![](https://www.dropbox.com/s/4xtllxwjpqy3uia/Screenshot%202015-11-16%2015.33.45.png?raw=1)

Defaults
--------

You can set defaults that will be applied for any new instance of SwiftyButton by modifying the `SwiftyButtonDefaults` structure:

```
SwiftyButtonDefaults.buttonColor = UIColor.cyanColor()
SwiftyButtonDefaults.cornerRadius = 8
...
```

Example
-------

![](https://www.dropbox.com/s/1bw9b559j5dilpx/Screenshot%202015-11-16%2015.07.54.png?raw=1)

License
-------

This project is copyrighted under the MIT license. Complete license can be found here: <https://github.com/TakeScoop/SwiftyButton/blob/master/LICENSE>

Credits
-------

 - Inspired by HTPressableButton: <https://github.com/herinkc/HTPressableButton>
 - Colors used in examples come from <https://flatuicolors.com/>

