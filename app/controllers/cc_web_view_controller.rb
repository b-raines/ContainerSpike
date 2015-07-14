class CCWebViewController < UIViewController
  def viewDidLoad
    self.view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(@web_view = UIWebView.new)
    web_view.delegate = self
    web_view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addConstraints(web_view_constraints)
    load_url
  end

  def load_url(url_to_load = url)
    self.web_view.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString(url_to_load)
      )
    )
  end

  def url
    ''
  end

  def web_view_constraints
    CCLayout.new(
      web_view,
      margin: [0]
    ).constraints
  end

  protected

  attr_reader :web_view
end
