
Pod::Spec.new do |s|
  s.name         = 'News'
  s.version      = '1.0.0'
  s.summary      = 'News.'
  s.description  = <<-DESC
News
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/News'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/News.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'News/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0']

  # Dependencias
end