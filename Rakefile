# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
    app.name                 = ENV.fetch('APP_NAME', 'Change')
    app.codesign_certificate = ENV.fetch('CODESIGN_CERTIFICATE', 'iOS Development: Derek Haswell (62RZUE5M5E)')
    app.identifier           = ENV.fetch('APP_ID', 'com.changecollective.prod')
    app.provisioning_profile = ENV.fetch('PROVISIONING_PROFILE', 'profiles/changecollectivedev.mobileprovision')

    app.frameworks << 'AVFoundation'
    app.frameworks << 'MediaPlayer'
    app.frameworks << 'MessageUI'
    app.frameworks << 'QuartzCore'
    app.frameworks << 'StoreKit'
    app.frameworks << 'AdSupport'
    app.weak_frameworks << 'HealthKit'

    app.version = '2.0'
    app.device_family = :iphone
    app.deployment_target = '7.1'
    app.sdk_version = '8.2'
    app.redgreen_style = :progress
    app.files += Dir.glob('./lib/*')
    app.fonts = [
      'AdobeTextPro-BoldIt.otf',
      'AdobeTextPro-It.otf',
      'AdobeTextPro-Regular.otf',
      'Mark Simonson - Proxima Nova Bold.ttf',
      'Mark Simonson - Proxima Nova Light Italic.ttf',
      'Mark Simonson - Proxima Nova Light.ttf',
      'Mark Simonson - Proxima Nova Regular Italic.ttf',
      'Mark Simonson - Proxima Nova Regular.ttf',
      'Mark Simonson - Proxima Nova Semibold.ttf',
    ]

    app.info_plist.tap do |plist|
      plist['FacebookAppID']                            = ENV.fetch('FB_APP_ID', '774612902551339')
      plist['FacebookDisplayName']                      = ENV.fetch('FB_DISPLAY_NAME', 'changecollective')
      plist['UIBackgroundModes']                        = %w(audio fetch)
      plist['UIViewControllerBasedStatusBarAppearance'] = true
      plist['CFBundleURLTypes']                         = [{
        'CFBundleURLName' => app.identifier,
        'CFBundleURLSchemes' => ['cc', "fb#{ENV.fetch('FB_APP_ID', '774612902551339')}"]
      }]
    end

  app.pods do
    pod 'Facebook-iOS-SDK'
  end
end
