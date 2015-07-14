class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup_ui
    register_url_protocols

    true
  end

  def setup_ui
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = NavigationManager.navigation_controller
    @window.makeKeyAndVisible
  end

  def register_url_protocols
    NSURLProtocol.registerClass(CCUrlProtocol)
  end
end
