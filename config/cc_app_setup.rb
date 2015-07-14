class CCAppSetup
  module DEFAULT
    APP_NAME             = 'Change'
    APP_ID               = 'com.changecollective.change'
    CODESIGN_CERTIFICATE = 'iPhone Distribution: Change Collective, Inc. (6C9N4WQWHL)'
    PROVISIONING_PROFILE = 'profiles/Change_V2_Beta.mobileprovision'
    BASE_URL             = 'http://changecollective.dev'
    FB_APP_ID            = '500463726775440'
    FB_DISPLAY_NAME      = 'Change Collective'
  end

  attr_reader :app

  def initialize(app)
    @app = app
  end

  def config
    configure_environment
    yield self if block_given?
  end

  def configure_application
    app.name                 = app.env['APP_NAME']
    app.identifier           = app.env['APP_ID']
    app.codesign_certificate = app.env['CODESIGN_CERTIFICATE']
    app.provisioning_profile = app.env['PROVISIONING_PROFILE']
    app.version = '2.0'
    app.device_family = :iphone
    app.deployment_target = '7.1'
    app.sdk_version = '8.4'
    app.redgreen_style = :progress
    configure_hockeyapp if app.hockeyapp?
  end

  def inject_frameworks
    app.frameworks << 'AVFoundation'
    app.frameworks << 'MediaPlayer'
    app.frameworks << 'MessageUI'
    app.frameworks << 'QuartzCore'
    app.frameworks << 'StoreKit'
    app.frameworks << 'AdSupport'
    app.weak_frameworks << 'HealthKit'
  end

  def add_resources
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
  end

  def add_plist_properties
    app.info_plist.tap do |plist|
      plist['FacebookAppID']                            = app.env['FB_APP_ID']
      plist['FacebookDisplayName']                      = app.env['FB_DISPLAY_NAME']
      plist['UIBackgroundModes']                        = %w(audio fetch)
      plist['UIViewControllerBasedStatusBarAppearance'] = true
      plist['CFBundleURLTypes']                         = [{
        'CFBundleURLName' => app.env['APP_ID'],
        'CFBundleURLSchemes' => ['cc', "fb#{app.env['FB_APP_ID']}"]
      }]
    end
  end

  def require_cocoapods
    app.pods do
      pod 'Facebook-iOS-SDK'
      pod 'JVFloatLabeledTextField'
      pod 'SHSPhoneComponent'
      pod 'AFNetworking'
      pod 'FXKeychain'
    end
  end

  def configure_hockeyapp
    print_environment_banner('HockeyApp / Staging')
    ensure_staging_setup

    app.entitlements['get-task-allow'] = false
    app.entitlements['keychain-access-groups'] = [app.seed_id + '.' + app.identifier]
    app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
    app.entitlements['aps-environment'] = 'production'
    app.entitlements['com.apple.developer.healthkit'] = true
    app.env['BASE_URL'] = ENV['BASE_URL'] || 'https://staging.changecollective.com'
    app.env['MIXPANEL_TOKEN'] = ENV['MIXPANEL_TOKEN']
    app.env['APPSFLYER_APP_ID'] = ENV['APPSFLYER_APP_ID']
    app.env['APPSFLYER_DEV_KEY'] = ENV['APPSFLYER_DEV_KEY']
    app.env['DEVICE'] = ENV['DEVICE']

    app.hockeyapp do
      set :api_token, ENV['HOCKEYAPP_API_TOKEN']

      # for information on the following variables, visit
      # http://support.hockeyapp.net/kb/api/api-apps#-u-post-api-2-apps-upload-u-
      set :notes_type, '1'
      set :notify, '0'
      set :status, '2'
    end
  end

  private

  def ensure_staging_setup
    if ENV['HOCKEYAPP_APP_IDENTIFIER'].nil? ||
      ENV['HOCKEYAPP_API_TOKEN'].nil?

      message = "ERROR: Necessary environment variables are not set:
         HOCKEYAPP_APP_IDENTIFIER, HOCKEYAPP_API_TOKEN"

      fail message
    end
  end

  def print_environment_banner(env)
    puts '********************************************************************************'
    puts "Building for #{env}"
    puts '********************************************************************************'
  end

  def configure_environment
    app.env['APP_NAME']             = ENV.fetch('APP_NAME', DEFAULT::APP_NAME)
    app.env['APP_ID']               = ENV.fetch('APP_ID', DEFAULT::APP_ID)
    app.env['CODESIGN_CERTIFICATE'] = ENV.fetch('CODESIGN_CERTIFICATE', DEFAULT::CODESIGN_CERTIFICATE)
    app.env['PROVISIONING_PROFILE'] = ENV.fetch('PROVISIONING_PROFILE', DEFAULT::PROVISIONING_PROFILE)
    app.env['BASE_URL']             = ENV.fetch('BASE_URL', DEFAULT::BASE_URL)
    app.env['FB_APP_ID']            = ENV.fetch('FB_APP_ID', DEFAULT::FB_APP_ID)
    app.env['FB_DISPLAY_NAME']      = ENV.fetch('FB_DISPLAY_NAME', DEFAULT::FB_DISPLAY_NAME)
  end
end
