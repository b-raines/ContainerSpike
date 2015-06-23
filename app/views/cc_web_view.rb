class CCWebView < UIWebView
  attr_accessor :url

  def load_url(url_to_load = self.url)
    self.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString(url_to_load)
      )
    )
  end
end
