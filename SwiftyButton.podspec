Pod::Spec.new do |s|

  s.name         = "SwiftyButton"
  s.version      = "0.7.0"
  s.summary      = "Simple and customizable button in Swift"

  s.description  = <<-DESC
                   SwiftyButton allows you to fully customize the style of your buttons with two UIButton subclasses: `FlatButton` and `PressableButton`.
                   DESC

  s.homepage     = "https://github.com/TakeScoop/SwiftyButton"
  s.license      = "MIT"
  s.author       = { "Scoop" => "ops@takescoop.com" }

  s.source       = { :git => "https://github.com/TakeScoop/SwiftyButton.git", :tag => s.version }
  s.source_files = "SwiftyButton/*.swift"
  s.framework    = "UIKit"

  s.requires_arc = true
  s.platform = :ios, "8.0"
end
