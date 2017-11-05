Pod::Spec.new do |s|
  s.name         = 'GithubSDK'
  s.version      = '0.0.2'
  s.author       = 'Evgeny Kalashnikov'
  s.homepage     = 'https://github.com/Lumyk/GithubSDK'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.summary      = "Github SDK for iOS and Android, written in Swift."

  s.source       = { :git => 'https://github.com/Lumyk/GithubSDK.git', :tag => s.version }

  s.requires_arc = true

  s.default_subspecs = 'Core'

  s.ios.deployment_target = '9.3'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.3'
  s.watchos.deployment_target = '3.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/GithubSDK/**/*.swift'
    ss.dependency 'Apollo/Core', '~> 0.7.0'
  end
end
