Change Log
==========

## [master]

## [0.7.0]

 - Added a `FlatButton.selectedColor` property to customize the appearance of a flat button in its selected state.
 - Adding Carthage support.

## [0.6.0]

 - **Breaking**: SwiftyButton has been split into two different button types: `FlatButton` and `PressableButton`. Please refer to the [README](./README.md) for more details.
 - Setting `cornerRadius` on a `CustomPressableButton` now adjusts the corner radius of the content view.
   [#4](https://github.com/TakeScoop/SwiftyButton/issues/4)

## [0.5.0]

 - **Breaking**: Converted code base to Swift 3.0.
 - Improved performance around background image generation when shadow height is zero.
   [#1](https://github.com/TakeScoop/SwiftyButton/issues/1)

## [0.4.0]

 - **Breaking**: Removed `SwiftyButton.Style` since it made the interface less flexible.
 - Fixed a crash that would occur when `button.shadowHeight = 0 && button.cornerRadius = 0`
 - Made `higlightedButtonColor` nullable. The button won't change color if this property is `nil` (default).

**Updating from v0.3.0?**: See the [README](./README.md) to learn how to convert from the `Flat/Pressable` button style using custom properties.

## [0.3.0]

 - SwiftyButton can now be configured with a Style (Flat or Pressable).
 - **Breaking**: Added a `higlightedButtonColor` property to allow flat buttons that change color on touch.

**Updating from v0.2.0?**: If you're using pressable buttons, the highlighted color of your SwiftyButton has to be manually set to `buttonColor`. It is recommended to use `SwiftyButton(style:)` or `SwiftyButton.updateWithStyle()` to avoid manually setting properties.


## [0.2.0]

 - Added `SwiftyCustomContentButton` to add subviews to a SwiftyButton.
 - Fixed button title inset layout on press.


## [0.1.0]

 - Initial release

[master]: https://github.com/TakeScoop/SwiftyButton/tree/master
[0.7.0]: https://github.com/TakeScoop/scoop-ios/releases/tag/0.7.0
[0.6.0]: https://github.com/TakeScoop/scoop-ios/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/TakeScoop/scoop-ios/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/TakeScoop/scoop-ios/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/TakeScoop/scoop-ios/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/TakeScoop/scoop-ios/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/TakeScoop/scoop-ios/compare/79b617a28cf2817d9de93f5d4c75a270bbf8ba67...0.1.0

