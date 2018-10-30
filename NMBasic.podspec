#
# Be sure to run `pod lib lint NMBasic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NMBasic'
  s.version          = '2.0.0'
  s.summary          = 'Managing All Basic Features Like Basic Object, Basic Manager, Basic Network Manager and Basic DB Manager'
  s.homepage         = 'https://github.com/nahlam/NMBasic'
  s.description      = 'Managing All Basic Features Like Basic Object, Basic Manager, Basic Network Manager and Basic DB Manager. Add All needed functiona;ity to setup our organization projects.'
  s.license      = 'Simplified BSD license'
  s.author       = { 'Nahla Mortada' => 'nahla.mortada@gmail.com' }
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source   = { :git => 'https://github.com/nahlam/NMBasic.git', :tag => s.version }

  s.source_files = 'NMBasic/Classes/*'
  s.resources = 'NMBasic/*.{png,jpeg,jpg,storyboard,xib,xcassets}'
  
  s.ios.framework  = 'Foundation'
  s.ios.framework  = 'UIKit'
  s.dependency 'GeneralLocalization', '~> 2.0.0'
  s.swift_version = '4.2'
  s.source_files = 'NMBasic/Classes/*.swift'
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 armv7 armv7s' , 'OTHER_LDFLAGS' => '-lObjC' }
  s.requires_arc = true
  s.resources = ['NMBasic/Assets/**/*']
  
  s.subspec 'BasicExtentions' do |ss|
      ss.ios.frameworks = 'Foundation', 'UIKit', 'GameplayKit', 'CoreTelephony'
      
      ss.dependency 'libPhoneNumber-iOS', '~> 0.9.13'
      
      ss.subspec 'Collections' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/Collections/*.swift'
      end
      
      ss.subspec 'Math' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/Math/*.swift'
      end
      
      ss.subspec 'String' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/String/*.{swift,h,m}'
      end
      
      ss.subspec 'UIButton' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIButton/*.swift'
      end
      
      ss.subspec 'UIComponents' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIComponents/*.swift'
      end
      
      ss.subspec 'UIImage' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIImage/*.{swift,h,m}'
      end
      
      ss.subspec 'UIImageView' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIImageView/*.swift'
      end
      
      ss.subspec 'UILabel' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UILabel/*.swift'
      end
      
      ss.subspec 'UIView' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIView/*.swift'
      end
      
      ss.subspec 'UIViewControllers' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/UIViewControllers/*.swift'
      end
      
      ss.subspec 'Other' do |sss|
          sss.source_files = 'NMBasic/Classes/BasicExtentions/Other/*.swift'
      end
      
  end
  
  
  s.subspec 'BasicObjects' do |ss|
      ss.source_files = 'NMBasic/Classes/BasicObjects/*.swift'
      ss.ios.frameworks = 'Foundation'
      ss.ios.frameworks = 'UIKit'
      
      ss.dependency 'SwiftyJSON', '~> 4.2.0'
      
  end
  
  
  s.subspec 'BasicManagers' do |ss|
      ss.source_files = 'NMBasic/Classes/BasicManagers/*.swift'
      
      ss.ios.frameworks = 'Foundation'
      ss.ios.frameworks = 'UIKit'
      
      ss.dependency 'Alamofire', '~> 4.7.3'
      ss.dependency 'SwiftyJSON', '~> 4.2.0'
      ss.dependency 'Kingfisher', '~> 4.10.0'
      ss.dependency 'Reachability', '~> 3.2'
      ss.dependency 'SBJson4', '~> 4.0.5'
      ss.dependency 'FMDB', '~> 2.7.2'
      ss.dependency 'MRProgress', '~> 0.8.3'
  end
  
  
  s.subspec 'Location' do |ss|
      ss.source_files = 'NMBasic/Classes/Modules/Location/*.swift'
      
      ss.ios.frameworks = 'Foundation'
      ss.ios.frameworks = 'UIKit'
      ss.ios.frameworks = 'CoreLocation'
      ss.ios.frameworks = 'MapKit'
      s.resource_bundles = {
          'BFLocationBundle' => ['NMBasic/Assets/**/*']
      }
  end
  
  s.subspec 'BasicUIControllers' do |ss|
      ss.source_files = 'NMBasic/Classes/BasicUIControllers/*.swift'
      
      ss.ios.frameworks = 'Foundation'
      ss.ios.frameworks = 'UIKit'
  end
  
  s.subspec 'CustomViews' do |ss|
      ss.ios.frameworks = 'Foundation'
      ss.ios.frameworks = 'UIKit'
      
      ss.dependency 'Kingfisher', '~> 4.10.0'
      
      ss.subspec 'Buttons' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/Buttons/*.swift'
      end
      
      ss.subspec 'ImageViews' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/ImageViews/*.swift'
      end
      
      ss.subspec 'Labels' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/Labels/*.swift'
      end
      
      ss.subspec 'LoadingIndicators' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/LoadingIndicators/*.swift'
      end
      
      ss.subspec 'Navigation' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/Navigation/*.swift'
      end
      
      ss.subspec 'TextView' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/TextView/*.swift'
      end
      
      ss.subspec 'Views' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/Views/*.swift'
      end
      
      ss.subspec 'ViewButton' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/ViewButton/*.swift'
      end
      
      ss.subspec 'Others' do |sss|
          sss.source_files = 'NMBasic/Classes/CustomViews/Others/*.swift'
      end
      
  end
end

