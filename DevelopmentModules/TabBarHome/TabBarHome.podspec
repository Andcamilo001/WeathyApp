
Pod::Spec.new do |s|
  s.name         = 'TabBarHome'
  s.version      = '1.0.0'
  s.summary      = 'TabBarHome.'
  s.description  = <<-DESC
TabBarHome
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/TabBarHome'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/TabBarHome.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'TabBarHome/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0']

  # Dependencias
  s.dependency 'Home'
  s.dependency 'Favorites'
  s.dependency 'News'
  s.dependency 'Coordinator'
end