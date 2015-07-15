class CCWebViewController < UIViewController
  include NotificationObserver
  include NoNavBar

  DEFAULT_URL = 'https://staging.changecollective.com/mobile/courses/10%25-happier/articles'

  attr_accessor :url

  def prefersStatusBarHidden; true; end

  def init
    super

    self.url = DEFAULT_URL

    self
  end

  def init_with_url(url_to_load, opts = {})
    vc = init

    vc.url = url_to_load

    vc
  end

  def viewDidLoad
    setup_web_view
  end

  def webView(webView, shouldStartLoadWithRequest: request, navigationType: navigation_type)
    url = request.URL.absoluteString
    if article_url?(url) && url !=  webView.url
      @next_web_view_controller = CCWebViewController.alloc.init_with_url(request.URL.absoluteString)
      @next_web_view_controller.load_request
      return false
    end

    true
  end

  def webViewDidStartLoad(webView)
    CCHUD.show
    self.view.insertSubview(@overlay = OverlayView.new, aboveSubview: web_view)
    webView.hidden = true
  end

  def webViewDidFinishLoad(webView)
    CCHUD.dismiss
    @overlay.removeFromSuperview
    webView.hidden = false
    if ContentNavigationManager.navigation_controller.visibleViewController != self
      ContentNavigationManager.navigate_to(self)
      Event.trigger('WillViewArticle')
    end
  end

  def load_request
    web_view.load_request
  end

  def web_view
    @web_view ||= CCWebView.alloc.init_with_url(self.url, delegate: self)
  end

  private

  def setup_web_view
    self.view.addSubview(web_view)
    self.view.addConstraints(web_view_constraints)
    web_view.load_request
  end

  def web_view_constraints
    CCLayout.new(
      web_view,
      margin: [0, 0, footer_height, 0]
    ).constraints
  end

  def article_url?(request_url)
    request_url.match(/articles\/(.)+$/)
  end

  def footer_height
    Footer::FooterView::DEFAULT_FOOTER_HEIGHT
  end

  class OverlayView < UIView
    def init
      super

      self.backgroundColor = UIColor.colorWithRed(0.2, green: 0.2, blue: 0.2, alpha: 0.2)

      self
    end

    def viewDidMoveToSuperview
      self.frame = self.superview.bounds
    end
  end
end
