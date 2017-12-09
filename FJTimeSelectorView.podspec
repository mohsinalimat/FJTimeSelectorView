Pod::Spec.new do |s|
  s.name         = "FJTimeSelectorView"
  s.version      = "1.0.0"
  s.summary      = "刻度选择器 :通过FJTimeScaleStyle类对刻度进行配置"
  s.homepage     = "http://www.jianshu.com/p/57c94ab121c3"
  s.license      = "MIT"
  s.author       = { 'fangjinfeng' => '116418179@qq.com' }
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/fangjinfeng/FJTimeSelectorView.git", :tag => "1.0.0" }
  s.source_files  = "FJTimeSelectorView", "*.{h,m}"
  s.requires_arc = true
  s.framework  = 'UIKit'
end
