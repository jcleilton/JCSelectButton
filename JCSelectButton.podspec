#
# Be sure to run `pod lib lint JCSelectButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCSelectButton'
  s.version          = '0.1.2'
  s.summary          = 'JCSelectButton: Just for fun ;)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'This is my first pod.'
  DESC

  s.homepage         = 'https://github.com/jcleilton/JCSelectButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cleilton' => 'jcleilton@gmail.com' }
  s.source           = { :git => 'https://github.com/jcleilton/JCSelectButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/jcleilton'

  s.ios.deployment_target = '11.0'

  s.source_files = 'src/**/*.swift'
  
  
  # s.resource_bundles = {
  #   'JCSelectButton' => ['JCSelectButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
