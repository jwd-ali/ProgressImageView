
Pod::Spec.new do |s|
  s.name         = "ProgressImageView"
  s.version      = "1.0.0"
  s.summary      = "ProgressImageView framework"
  s.description  = <<-DESC
                  ProgressImageView is a framework to show circular progress around the image.You can animate this progress and can have different colors and widths
                   DESC
  s.homepage     = "https://github.com/jwd-ali/IOS-Portfolio"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Jawad Ali" => "L060214@gmail.com" }
  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/jwd-ali/ProgressImageView.git", :tag => "#{s.version}" }

  s.source_files = "ProgressImageView/**/*.{h,m,swift}"
  s.requires_arc = true
  s.swift_version = "5.0"
  s.frameworks = "XCTest"
  
end
