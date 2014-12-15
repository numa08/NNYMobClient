#
# Be sure to run `pod lib lint NNYMobClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NNYMobClient"
  s.version          = "0.1.0"
  s.summary          = "NNYMobClient is client for Y!Mobile"
  s.description      = <<-DESC
                       NNYMobClient is client library for Y!Mobile's wifi router.

                       ## features
                         - can get signal strength
                       DESC
  s.homepage         = "https://github.com/numa08/NNYMobClient"
  s.license          = 'MIT'
  s.author           = { "numa08" => "n511287@gmail.com" }
  s.source           = { :git => "https://github.com/numa08/NNYMobClient.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/numa08'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes', 'Pod/libs/KissXML/KissXML/**/*.{h,m}'
  s.library = 'xml2'
  s.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
end
