#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'google_play_game_services'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for accessing Google Play Game Services API'
  s.description      = <<-DESC
Flutter plugin for accessing Google Play Game Services API.
                       DESC
  s.homepage         = 'https://github.com/pihi/flourine/tree/master/packages/google_play_game_services'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'P. Isaac Hildebrandt' => 'isaac@pihimedia.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  
  s.ios.deployment_target = '8.0'
end
