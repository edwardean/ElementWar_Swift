# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ElementWar_Swift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ElementWar_Swift

  pod 'FLEX'

  pod 'Fabric'
  pod 'Crashlytics'
  
  pod 'SnapKit'
  pod 'SwiftProtobuf', git: 'https://github.com/apple/swift-protobuf.git', :tag => '0.9.26'
  
  pod 'AKFoundation', :path => '../AKFoundation'
  #pod 'AKFoundation', :git => 'git@github.com:ArtisanKid/AKFoundation.git'
  
  pod 'AKUIKit', :path => '../AKUIKit'
  #pod 'AKUIKit', :git => 'git@github.com:ArtisanKid/AKUIKit.git'
  
  pod 'AKError', :path => '../AKError'
  #pod 'AKError', :git => 'git@github.com:ArtisanKid/AKError.git'
  
  pod 'AKLogKit', :path => '../AKLogKit'
  #pod 'AKLogKit', :git => 'git@github.com:ArtisanKid/AKLogKit.git'
  
  pod 'AKDatabaseManager', :path => '../AKDatabaseManager'
  #pod 'AKDatabaseManager', :git => 'git@github.com:ArtisanKid/AKDatabaseManager.git'
  
  pod 'AKSessionManager', :path => '../AKSessionManager'
  #pod 'AKSessionManager', :git => 'git@github.com:ArtisanKid/AKSessionManager.git'
  
  pod 'AKDownloadManager', :path => '../AKDownloadManager'
  #pod 'AKDownloadManager', :git => 'git@github.com:ArtisanKid/AKDownloadManager.git'

  pod 'AKSocketManager', :path => '../AKSocketManager'
  #pod 'AKSocketManager', :git => 'git@github.com:ArtisanKid/AKSocketManager.git'
  
  pod 'AKModel', :path => '../AKModel'
  #pod 'AKModel', :git => 'git@github.com:ArtisanKid/AKModel.git'
  
  pod 'EWModel_Swift', :path => '../EWModel_Swift'
  #pod 'EWModel_Swift', :git => 'git@github.com:ArtisanKid/EWModel_Swift.git'
  
  pod 'EWMessageModel_Swift', :path => '../EWMessageModel_Swift'
  #pod 'EWMessageModel_Swift', :git => 'git@github.com:ArtisanKid/EWMessageModel_Swift.git'
  
  pod 'EWDataCenter_Swift', :path => '../EWDataCenter_Swift'
  #pod 'EWDataCenter_Swift', :git => 'git@github.com:ArtisanKid/EWDataCenter_Swift.git'
  
  pod 'AKWeChatSDK', :path => '../AKWeChatSDK'
  #pod 'AKWeChatSDK', :git => 'git@github.com:ArtisanKid/AKWeChatSDK.git'
  
  pod 'AKWeChatManager', :path => '../AKWeChatManager'
  #pod 'AKWeChatManager', :git => 'git@github.com:ArtisanKid/AKWeChatManager.git'
  
  pod 'AKWeiboSDK', :path => '../AKWeiboSDK'
  #pod 'AKWeiboSDK', :git => 'git@github.com:ArtisanKid/AKWeiboSDK.git'
  
  pod 'AKWeiboManager', :path => '../AKWeiboManager'
  #pod 'AKWeiboManager', :git => 'git@github.com:ArtisanKid/AKWeiboManager.git'
  
  pod 'AKQQSDK', :path => '../AKQQSDK'
  #pod 'AKWeiboSDK', :git => 'git@github.com:ArtisanKid/AKWeiboSDK.git'
  
  pod 'AKQQManager', :path => '../AKQQManager'
  #pod 'AKQQManager', :git => 'git@github.com:ArtisanKid/AKQQManager.git'
  
  pod 'AKViewController', :path => '../AKViewController'
  #pod 'AKViewController', :git => 'git@github.com:ArtisanKid/AKViewController.git'
  
  pre_install do |installer|
      # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
      def installer.verify_no_static_framework_transitive_dependencies; end
  end

  target 'ElementWar_SwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ElementWar_SwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
