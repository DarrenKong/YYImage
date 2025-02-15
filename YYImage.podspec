Pod::Spec.new do |s|
  s.name         = 'YYImage'
  s.summary      = 'Image framework for iOS to display/encode/decode animated WebP, APNG, GIF, and more.'
  s.version      = '1.1.5'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/DarrenKong/YYImage'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => 'https://github.com/DarrenKong/YYImage.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'YYImage/*.{h,m}'
    core.public_header_files = 'YYImage/*.{h}'
    core.libraries = 'z'
  end

  s.subspec 'WebP' do |webp|
    webp.dependency 'YYImage/Core'
    webp.dependency 'libwebp'
  end

  s.subspec 'libwebp' do |libwebp|
    libwebp.dependency 'YYImage/Core'
    libwebp.dependency 'libwebp'
    libwebp.xcconfig = {
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
  end

end
