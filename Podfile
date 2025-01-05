# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

workspace 'Weathy.xcworkspace'

def pod_lottie
  pod 'lottie-ios'
end

def net_pod
  pod 'NetworkWeathy', :path => 'DevelopmentModules/NetworkWeathy'
end

def public_pods
  pod 'RemoteAssets', :path => 'DevelopmentModules/RemoteAssets'
  pod 'DSCore', :path => 'DevelopmentModules/DSCore'
end

def coordinator
  pod 'Coordinator', :path => 'DevelopmentModules/Coordinator'
end

def network_pods
  pod 'NetworkInterface', :path => 'DevelopmentModules/NetworkInterface'
  pod 'Alamofire'
end

def firebase_pods
  pod 'FirebaseCore'
  pod 'FirebaseAuth'
  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Google'
end

def test_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'iOSSnapshotTestCase'
  pod 'Nimble-Snapshots'
  pod 'AppAuth'
  pod 'AppCheckCore'
  pod 'FirebaseAppCheckInterop'
  pod 'FirebaseAuth'
  pod 'FirebaseAuthUI'
  pod 'FirebaseGoogleAuthUI'
  pod 'SnapshotTesting'
end

def tab_pods
  pod 'Home', :path => 'DevelopmentModules/Home'
  pod 'Favorites', :path => 'DevelopmentModules/Favorites'
  pod 'News', :path => 'DevelopmentModules/News'
end

target 'Weathy' do
  use_frameworks!
  
  inherit! :search_paths
  
  pod_lottie
  public_pods
  network_pods
  firebase_pods
  net_pod
  pod 'WeathyLogin', :path => 'DevelopmentModules/WeathyLogin'
end

# Modules

target 'WeathyLogin' do
  use_frameworks!

  project 'DevelopmentModules/WeathyLogin/WeathyLogin.xcodeproj'

  pod_lottie
  public_pods
  firebase_pods
  pod 'TabBarHome', :path => 'DevelopmentModules/TabBarHome'

  target 'WeathyLoginTests' do
     
     project 'DevelopmentModules/WeathyLogin/WeathyLogin.xcodeproj'
     
     test_pods

 end
end

target 'RemoteAssets' do
  use_frameworks!

  project 'DevelopmentModules/RemoteAssets/RemoteAssets.xcodeproj'

  pod_lottie
end

target 'DSCore' do
  use_frameworks!

  project 'DevelopmentModules/DSCore/DSCore.xcodeproj'

  public_pods
end

target 'Description' do
  use_frameworks!

  project 'DevelopmentModules/Description/Description.xcodeproj'

  public_pods
  network_pods
  net_pod

  target 'DescriptionTests' do
     
     project 'DevelopmentModules/Description/Description.xcodeproj'
     
     test_pods

 end
end

target 'News' do
  use_frameworks!

  project 'DevelopmentModules/News/News.xcodeproj'

  public_pods
  network_pods
end

target 'Favorites' do
  use_frameworks!

  project 'DevelopmentModules/Favorites/Favorites.xcodeproj'

  public_pods
  network_pods
  coordinator


  target 'FavoritesTests' do
     
     project 'DevelopmentModules/Favorites/Favorites.xcodeproj'
     
     test_pods

 end
end

target 'Home' do
  use_frameworks!

  project 'DevelopmentModules/Home/Home.xcodeproj'

  public_pods
  network_pods
  net_pod
  coordinator

  target 'HomeTests' do
     
     project 'DevelopmentModules/Home/Home.xcodeproj'
     
     test_pods

 end
end

target 'TabBarHome' do
  use_frameworks!

  project 'DevelopmentModules/TabBarHome/TabBarHome.xcodeproj'

  tab_pods
  coordinator

  target 'TabBarHomeTests' do
     
     project 'DevelopmentModules/TabBarHome/TabBarHome.xcodeproj'
     
     test_pods
     public_pods

 end
end

target 'NetworkWeathy' do
  use_frameworks!

  project 'DevelopmentModules/NetworkWeathy/NetworkWeathy.xcodeproj'

  network_pods
  firebase_pods
end

target 'NetworkInterface' do
  use_frameworks!

  project 'DevelopmentModules/NetworkInterface/NetworkInterface.xcodeproj'

end

target 'Coordinator' do
  use_frameworks!
  
  pod 'Description', :path => 'DevelopmentModules/Description'

  project 'DevelopmentModules/Coordinator/Coordinator.xcodeproj'

end
