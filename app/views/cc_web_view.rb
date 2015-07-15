class CCWebView < UIWebView
  attr_accessor :url

  def init_with_url(url, opts = {})
    web_view = init

    web_view.url = url
    web_view.delegate = opts[:delegate]
    web_view.translatesAutoresizingMaskIntoConstraints = false

    web_view
  end

  def load_request(request_url = url)
    self.url = request_url

    self.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString(url)
      )
    )
  end
end
