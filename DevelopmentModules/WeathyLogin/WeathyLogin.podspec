
Pod::Spec.new do |s|
  s.name         = 'WeathyLogin'
  s.version      = '1.0.0'
  s.summary      = 'Módulo para gestionar la UX del login.'
  s.description  = <<-DESC
    Gestiona la logica del login y la UX de la misma de la app.
  DESC
  s.homepage     = 'https://github.com/Andcamilo001/WeathyLogin'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tu Nombre' => 'andcamilo001@gmail.com' }
  s.source       = s.source = { :git => 'https://github.com/Andcamilo001/WeathyLogin.git', :tag => '1.0.0' }

  s.platform     = :ios, '14.0'
  s.source_files = 'WeathyLogin/**/*.{swift,h,m}'
  s.requires_arc = true
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']

  # Dependencias
  s.dependency 'lottie-ios'
  s.dependency 'RemoteAssets'
  s.dependency 'DSCore'
  s.dependency 'FirebaseCore'
  s.dependency 'GoogleSignIn'
  s.dependency 'FirebaseAuth'
  s.dependency 'TabBarHome'

# Dependencias para pruebas
  s.test_spec 'Tests' do |test_spec|
  test_spec.source_files = 'WeathyLoginTests/**/*.{swift}'
  test_spec.dependency 'Quick'
  test_spec.dependency 'Nimble'
  test_spec.dependency 'Nimble-Snapshots'
 end
end