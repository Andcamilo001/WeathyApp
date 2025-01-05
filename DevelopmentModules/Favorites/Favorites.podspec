
Pod::Spec.new do |s|
  s.name         = 'Favorites'
  s.version      = '1.0.0'
  s.summary      = 'Favorites.'
  s.description  = <<-DESC
Favorites
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/Favorites'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/Favorites.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'Favorites/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0']

  # Dependencias
  s.dependency 'Coordinator'
end