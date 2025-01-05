
Pod::Spec.new do |s|
  s.name         = 'RemoteAssets'
  s.version      = '1.0.0'
  s.summary      = 'Módulo para gestionar assets remotos.'
  s.description  = <<-DESC
    RemoteAssets proporciona herramientas para gestionar y cargar assets de forma remota en aplicaciones iOS.
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/RemoteAssets.git'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/RemoteAssets.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'RemoteAssets/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']

  # Dependencias
  s.dependency 'lottie-ios'
end