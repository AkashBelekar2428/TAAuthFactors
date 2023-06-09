#
# Be sure to run `pod lib lint TAAuthFactors.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TAAuthFactors'
  s.version          = '1.1.4'
  s.summary          = 'Simple Library of TAAuthFactors.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'One Of the best Library. Very simple to use and readable'
                      DESC

  s.homepage         = 'https://github.com/akashbelekar2428/TAAuthFactors'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'akashbelekar2428' => 'akashbelekar108@gmail.com' }
  s.source           = { :git => 'https://github.com/akashbelekar2428/TAAuthFactors.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.dependency 'Alamofire', '~> 5.4'
  s.dependency 'SVProgressHUD'
  s.dependency 'ObjectMapper', '~> 4.2'
  s.resources = [
                  'Source/Assets/*.xcassets',
                  'Source/ComponentManager/*.swift',
                  'Source/Configurations/*.swift',
                  'Source/EmailAuth/**/*.swift',
                  'Source/Fonts/*.ttf',
                  'Source/LoginAuth/*.swift',
                  'Source/MobileAuth/*.swift',
                  'Source/Network/*.swift',
                  'Source/PINAuth/*.swift',
                  'Source/Presentor/*.swift',
                  'Source/Protocol/*.swift',
                  'Source/Request/*.swift',
                  'Source/Resources/*.xib',
                  'Source/Response/*.swift',
                  'Source/UIClasses/*.swift',
                  'Source/Utility/*.swift',
                  'Source/ValidationManager/*.swift'
                ]
  s.source_files = 'Source/**/*.swift'
  
  # s.resource_bundles = {
  #   'TAAuthFactors' => ['TAAuthFactors/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'/Users/akashbelekar/Desktop/Ambdany/TAAuthFactor/TAAuthFactors/Example
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
