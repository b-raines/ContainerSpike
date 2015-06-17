class ContentWebView < UIWebView
  include CCAutoLayoutView

  def init
    super

    self.margin = [0]
    self.delegate = self
    self.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString('http://google.com')
      )
    )

    self
  end
end
