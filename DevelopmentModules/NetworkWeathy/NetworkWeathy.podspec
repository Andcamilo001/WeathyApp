
Pod::Spec.new do |s|
  s.name         = 'NetworkWeathy'
  s.version      = '1.0.0'
  s.summary      = 'Networking de la app.'
  s.description  = <<-DESC
Networking
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/NetworkWeathy'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/NetworkWeathy.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'NetworkWeathy/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']

  # Dependencias
  s.dependency 'Alamofire'
  s.dependency 'NetworkInterface'
end