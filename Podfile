# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

target 'TyperMemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for TyperMemo 
  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'ReactorKit'
  pod 'Then'
#  pod 'SnapKit'
#  pod 'RxSwift'
#  pod 'XCGLogger'
#  pod 'RealmSwift'
#  pod 'Cuckoo'
  def testing_pods
    pod 'Quick'
    pod 'Nimble'
  end
  target 'TyperMemoTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'TyperMemoUITests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end
