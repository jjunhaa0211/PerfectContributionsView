#Pod::Spec.new do |s|
#  s.name             = 'PContributionsView'
#  s.version          = '0.1.0'
#  s.summary          = 'This library was originally created for github grass.'
#
#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC
#
#  s.homepage         = 'https://github.com/jjunhaa0211/PerfectContributionsView'
#  s.license          = { :type => 'MIT', :file => 'LICENSE' }
#  s.author           = { 'jjunhaa0211' => 'goodjunha@gmail.com' }
#  s.source           = { :git => 'https://github.com/jjunhaa0211/PerfectContributionsView.git', :tag => s.version.to_s }
#
#  s.ios.deployment_target = '15.0'
#
#  s.source_files = 'PContributionsView/Classes/**/*'
#
#  # s.resource_bundles = {
#  #   'PContributionsView' => ['PContributionsView/Assets/*.png']
#  # }
#
#  # s.public_header_files = 'Pod/Classes/**/*.h'
#  # s.frameworks = 'UIKit', 'MapKit'
#  # s.dependency 'AFNetworking', '~> 2.3'
#end

#Pod::Spec.new do |s|
#
#   # 등록될 모듈이름,  podspec파일 이름은 동일해야 함
#   s.name = 'PContributionsView'
#
#   # 모듈의 버전
#   s.version = '0.1.0'
#
#   # 설명
#   s.summary = 'This library was originally created for github grass.'
#   s.homepage = 'https://github.com/jjunhaa0211/PerfectContributionsView'
#   s.license = { :type => 'MIT' }
#   s.author = { 'jjunhaa0211' => 'goodjunha@gmail.com' }
#
#
#   # git 저장소 or zip 아카이브 주소
#   # 태그와 버전이 같을 필요는 없으나 관리를 위해 맞추는 편이다
#   s.source = { :git => 'https://github.com/jjunhaa0211/PerfectContributionsView.git' , :tag => s.version.to_s }
#
#   # 특정 폴더인 경우
#   #s.source = { :path => './path' }
#
#
#   # 소스외에 프레임워크 자체를 배포하는 경우 vendored_frameworks에 정의
##   s.vendored_frameworks = 'MyLibrary.framework'
#
#
#   s.platform = :ios, '12.0'
##   s.io.deployment_target = '12.0'
#   s.swift_version = '5.0'
#   s.cocoapods_version = '>= 1.9.0'
#
#
#   # 소스파일을 포함하는 경우 소스파일 경로
##   s.source_files = 'Classes/**/*'
#
#   # 디펜던시
##   s.dependency 'Library-name', '1.0.0'
#end




Pod::Spec.new do |s|
  s.name                = "PContributionsView"
  s.version             = "0.1.0"
  s.summary             = "This library was originally created for github grass."

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage            = "https://github.com/jjunhaa0211/PerfectContributionsView"
  s.license             = "{ :type => 'MIT' }"

  s.author              =  {'jjunhaa0211' => 'goodjunha@gmail.com' }
  s.platform            = :ios, "13.0"

  s.module_name         = "SDK1"
  s.source              = { :git => 'https://github.com/jjunhaa0211/PerfectContributionsView.git', :tag => s.version.to_s }

#  s.source_files        = 'SDK1/SDK1/SDK1.h'

end
