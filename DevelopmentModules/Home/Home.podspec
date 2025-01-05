
Pod::Spec.new do |s|
  s.name         = 'Home'
  s.version      = '1.0.0'
  s.summary      = 'Home.'
  s.description  = <<-DESC
Home
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/Home'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/Home.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'Home/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0']

  # Dependencias
  s.dependency 'NetworkWeathy'
  s.dependency 'NetworkInterface'
  s.dependency 'Coordinator'
end