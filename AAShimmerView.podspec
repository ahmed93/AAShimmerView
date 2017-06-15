#
# Be sure to run `pod lib lint AAShimmerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AAShimmerView'
  s.version          = '1.0.0'
  s.summary          = 'AAShimmerView aims to bring Facebook loading Views to all apps'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A quick way to present the user with loading indicator without blocking the user UI. FBShimmerView aims to enhance the User experince when waiting the API requests to finish. FBShimmerView is inspired from Facebook.
                       DESC

  s.homepage         = 'https://github.com/ahmed93/AAShimmerView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmed Mohamed Magdi' => 'ahmed.moh.magdi93@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmed93/AAShimmerView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'AAShimmerView/Classes/**/*'

end
