
Pod::Spec.new do |s|

  s.name         = "UMShareSDK"
  s.version      = "1.0.1"
  s.summary      = "UMCShare分享组件"
  s.description  = "基于友盟社会化分享组件,包含精简版QQ SDK、精简版微博SDK、完整微信SDK(带微信支付功能)"
  s.homepage     = "https://github.com/duxinfeng/UMShareSDK"
  s.license      = "MIT"
  s.author       = { "GX H" => "1076000966@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/MakongYa/UMShareSDK.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.dependency "UMCommon", "~> 7.3.7"
  
  s.subspec 'UMShare' do |ss|
    ss.vendored_frameworks = 'UMShare/UMShare.framework'
    ss.frameworks = 'CoreGraphics'
    ss.libraries = 'sqlite3'
    
    ss.subspec 'UI' do |sss|
        sss.vendored_frameworks = 'UMShare/UMSocialUI/UShareUI.framework'
    end
  end

  s.subspec 'Social' do |ss|
    ss.dependency 'UMShareSDK/UMShare'

    ss.subspec 'ReducedQQ' do |sss|
      sss.vendored_libraries = 'UMShare/SocialLibraries/QQ/*.a'
      sss.source_files = 'UMShare/SocialLibraries/QQ/*.{h,m}'
      sss.public_header_files = 'UMShare/SocialLibraries/QQ/*.h'
      sss.dependency 'UMShareSDK/UMShare'
    end

    ss.subspec 'ReducedSina' do |sss|
      sss.vendored_libraries = 'UMShare/SocialLibraries/Sina/*.a'
      sss.source_files = 'UMShare/SocialLibraries/Sina/*.{h,m}'
      sss.public_header_files = 'UMShare/SocialLibraries/Sina/*.h'
      sss.frameworks = 'Photos'
      sss.dependency 'UMShareSDK/UMShare'
    end

    ss.subspec 'ReducedWeChat' do |sss|
      sss.vendored_libraries = 'UMShare/SocialLibraries/WeChat/*.a'
      sss.source_files = 'UMShare/SocialLibraries/WeChat/*.{h,m}'
      sss.public_header_files = 'UMShare/SocialLibraries/WeChat/*.h'
      sss.dependency 'UMShareSDK/UMShare'
    end

    ss.subspec 'WeChat' do |sss|
      sss.vendored_libraries = 'UMShare/SocialLibraries/WeChat/WechatSDK/*.a'
      sss.source_files = 'UMShare/SocialLibraries/WeChat/WechatSDK/*.{h,m}'
      sss.public_header_files = 'UMShare/SocialLibraries/WeChat/WechatSDK/*.h'
      sss.frameworks = 'SystemConfiguration','CoreTelephony'
      sss.libraries = 'sqlite3','c++','z'
      sss.dependency "UMShareSDK/Social/ReducedWeChat"
    end

  end

end
