#
#  Be sure to run `pod spec lint NMBasic.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "NMBasic"
    s.version      = "1.1.4"
    s.summary      = "Managing All Basic Features Like Basic Object, Basic Manager, Basic Network Manager and Basic DB Manager"
    s.homepage     = "https://github.com/nahlam/NMBasic"
    s.description  = "Managing All Basic Features Like Basic Object, Basic Manager, Basic Network Manager and Basic DB Manager. Add All needed functiona;ity to setup our organization projects."
    s.license      = "Simplified BSD license"
    s.author       = { "Nahla Mortada" => "nahla.mortada@gmail.com" }
    s.platform     = :ios, "9.0"
    s.ios.deployment_target = "9.0"
    s.source   = { :git => "https://github.com/nahlam/NMBasic.git", :tag => s.version }
    s.source_files = "NMBasic/*"
    s.resources = "NMBasic/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
    s.pod_target_xcconfig =  {
    'SWIFT_VERSION' => '4.0',
    }

    s.requires_arc = true

    s.ios.framework  = 'Foundation'
    s.ios.framework  = 'UIKit'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }


    s.subspec 'BasicExtentions' do |ss|
        ss.source_files = 'NMBasic/BasicExtentions/**/*.swift'
        ss.ios.frameworks = 'Foundation', 'UIKit', 'GameplayKit', 'CoreTelephony'

        ss.dependency 'libPhoneNumber-iOS', '~> 0.9.10'
    end


    s.subspec 'BasicObjects' do |ss|
        ss.source_files = 'NMBasic/BasicObjects/**/*.swift'
        ss.ios.frameworks = 'Foundation'
        ss.ios.frameworks = 'UIKit'

        ss.dependency 'SwiftyJSON', '~> 4.0.0'
        ss.dependency 'GeneralLocalization', '~> 1.0.0'
    end


    s.subspec 'BasicManagers' do |ss|
        ss.source_files = 'NMBasic/BasicManagers/**/*.swift'

        ss.ios.frameworks = 'Foundation'
        ss.ios.frameworks = 'UIKit'

        ss.dependency 'Alamofire', '~> 4.5.1'
        ss.dependency 'SwiftyJSON', '~> 4.0.0'
        ss.dependency 'AlamofireImage', '~> 3.3.0'
        ss.dependency 'GeneralLocalization', '~> 1.0.0'
        ss.dependency 'Reachability', '~> 3.2'
        ss.dependency 'SBJson4', '~> 4.0.5'
        ss.dependency 'FMDB', '~> 2.7.2'
        ss.dependency 'MRProgress', '~> 0.8.3'

        ss.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PROJECT_DIR)/NMBasic/Frameworks' }
    end

    s.subspec 'Location' do |ss|
        ss.source_files = 'NMBasic/Modules/Location/*.swift'

        ss.ios.frameworks = 'Foundation'
        ss.ios.frameworks = 'UIKit'
        ss.ios.frameworks = 'CoreLocation'
        ss.ios.frameworks = 'MapKit'
        s.resources = "NMBasic/Modules/Location/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
        s.resource_bundles = {
            'BFLocationBundle' => ['NMBasic/Modules/Location/*.{storyboard,xcassets}']
        }
        end


    s.subspec 'BasicUIControllers' do |ss|
        ss.source_files = 'NMBasic/BasicUIControllers/**/*.swift'

        ss.ios.frameworks = 'Foundation'
        ss.ios.frameworks = 'UIKit'
    end

    s.subspec 'CustomViews' do |ss|
        ss.source_files = 'NMBasic/CustomViews/**/*.swift'

        ss.ios.frameworks = 'Foundation'
        ss.ios.frameworks = 'UIKit'

        ss.dependency 'AlamofireImage', '~> 3.3.0'
    end

end


