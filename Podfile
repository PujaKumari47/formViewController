# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'UserInformation' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'IQKeyboardManagerSwift'


  target 'UserInformationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'UserInformationUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end
