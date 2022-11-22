Pod::Spec.new do |s|
  s.name             = 'PContributionsView'
  s.version          = '0.1.0'
  s.summary          = 'This library was originally created for github grass.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jjunhaa0211/PerfectContributionsView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'junha' => 'goodjunha@gmail.com' }
  s.source           = { :git => 'https://github.com/jjunhaa0211/PerfectContributionsView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'PContributionsView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PContributionsView' => ['PContributionsView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
