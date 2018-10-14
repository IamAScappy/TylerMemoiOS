# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

target 'TyperMemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  # Pods for TyperMemo
  pod 'SwiftLint'
  pod 'SwiftGen', '~> 5.3.0'
  pod 'ReactorKit'
  pod 'Then'
  pod 'Result', '~> 4.0.0'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if [].include? target.name
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4'
        end
      end
    end
  end
  def testing_pods
    pod 'Quick', '~> 1.3'
    pod 'Nimble', '~> 7.3'
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
