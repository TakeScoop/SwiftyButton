Pod::Spec.new do |s|

  s.name         = "SwiftyButton"
  s.version      = "0.2.0"
  s.summary      = "Simple and customizable button in Swift"

  s.description  = <<-DESC
                   SwiftyButton is a UIButton subclass that allows you to create shadowed/pressable buttons via a very simple interface.
                   DESC

  s.homepage     = "https://github.com/TakeScoop/SwiftyButton"
  s.license      = "MIT"
  s.author       = { "Scoop" => "ops@takescoop.com" }

  s.source       = { :git => "https://github.com/TakeScoop/SwiftyButton.git", :tag => "0.2.0" }
  s.source_files = "SwiftyButton/SwiftyButton.swift", "SwiftyButton/SwiftyButton+ResizableImage.swift"
  s.framework    = "UIKit"

  s.requires_arc = true
  s.platform = :ios, "8.0"

  s.subspec 'CustomContent' do |sp|
    sp.source_files = "SwiftyButton/*.swift"
    sp.dependency 'PureLayout', '~> 3.0'
  end
end
