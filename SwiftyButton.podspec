Pod::Spec.new do |s|

  s.name         = "SwiftyButton"
  s.version      = "0.0.1"
  s.summary      = "Simple and customizable button in Swift"

  s.description  = <<-DESC
                   SwiftyButton is a UIButton subclass that allows you to create shadowed/pressable buttons via a very simple interface.
                   DESC

  s.homepage     = "https://github.com/TakeScoop/SwiftyButton"
  s.license      = "MIT"
  s.author       = { "Scoop" => "ops@takescoop.com" }

  s.source       = { :git => "git@github.com:TakeScoop/SwiftyButton.git" }
  s.source_files = "SwiftyButton/*.swift"
  s.framework    = "UIKit"

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"

end