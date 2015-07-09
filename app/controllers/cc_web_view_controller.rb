class CCWebViewController < UIViewController
  def init_with_delegate(delegate)
    init

    self.delegate = delegate

    self
  end

  def viewDidLoad
    self.view.addSubview(@web_view = UIWebView.new)
    self.view.translatesAutoresizingMaskIntoConstraints = false
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

  def delegate=(delegate)
    self.view.delegate = delegate
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
