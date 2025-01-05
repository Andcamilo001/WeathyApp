
Pod::Spec.new do |s|
  s.name         = 'Coordinator'
  s.version      = '1.0.0'
  s.summary      = 'Coordinator.'
  s.description  = <<-DESC
Coordinator
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/Coordinator'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/Coordinator.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'Coordinator/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0']

  # Dependencias
  s.dependency 'Description'
end