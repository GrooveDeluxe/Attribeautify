#
# Be sure to run `pod lib lint Attribeautify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Attribeautify'
  s.version          = '0.1.1'
  s.summary          = 'Very handy attributed strings builder'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Very handy attributed strings builder.
                       DESC

  s.homepage         = 'https://github.com/GrooveDeluxe/Attribeautify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'groovedeluxe@gmail.com' => 'groovedeluxe@gmail.com' }
  s.source           = { :git => 'https://github.com/GrooveDeluxe/Attribeautify.git', :tag => s.version.to_s }
#  s.social_media_url = 'https://twitter.com/GrooveDeluxe'

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.0'

  s.source_files = 'Sources/**/*'

end
