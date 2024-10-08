Pod::Spec.new do |s|
  s.name             = 'XSplashScreen'
  s.version          = '1.0.1'
  s.summary          = 'XSplashScreen summary'
  s.description      = 'XSplashScreen description'

  s.homepage         = 'https://github.com/luosch/XSplashScreen'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luosch' => 'i@lsich.com' }
  s.source           = { :git => 'https://github.com/luosch/XSplashScreen.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'

  s.source_files = 'XSplashScreen/Classes/**/*'
  s.framework    = 'UIKit', 'Foundation', 'QuartzCore'
  s.swift_versions = ['5.0']
end
