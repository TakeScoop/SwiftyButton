Change Log
==========

## [0.3.0]

 - SwiftyButton can now be configured with a Style (Flat or Pressable).
 - **Breaking**: Added a `higlightedButtonColor` property to allow flat buttons that change color on touch.

**Updating from v0.2.0?**: If you're using pressable buttons, the highlighted color of your SwiftyButton has to be manually set to `buttonColor`. It is recommended to use `SwiftyButton(style:)` or `SwiftyButton.updateWithStyle()` to avoid manually setting properties.


## [0.2.0]

 - Added `SwiftyCustomContentButton` to add subviews to a SwiftyButton.
 - Fixed button title inset layout on press.


## [0.1.0]

 - Initial release

[0.3.0]: https://github.com/TakeScoop/scoop-ios/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/TakeScoop/scoop-ios/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/TakeScoop/scoop-ios/compare/79b617a28cf2817d9de93f5d4c75a270bbf8ba67...0.1.0

