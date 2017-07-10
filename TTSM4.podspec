Pod::Spec.new do |s|
  s.name             = 'TTSM4'
  s.version          = '1.0.0'
  s.summary          = '国家加密标准SM4的Objective-C封装'
  s.homepage         = 'https://github.com/TToooo/TTSM4'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TTwong' => 'sponge720@foxmail.com' }
  s.source           = { :git => 'https://github.com/TToooo/TTSM4.git', :tag => "v#{s.version}" } # = "v1.0.0"

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'TTSM4/TTAlgorithmSM4/*.{h,m,c}'

end
