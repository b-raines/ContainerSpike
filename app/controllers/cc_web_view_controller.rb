class CCWebViewController < UIViewController
  def init_with_delegate(delegate)
    init

    self.delegate = delegate

    self
  end

  def load_url(url_to_load = url)
    self.view.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString(url_to_load)
      )
    )
  end

  def delegate=(delegate)
    self.view.delegate = delegate
  end

  def url
    self.view.url || ''
  end
end
