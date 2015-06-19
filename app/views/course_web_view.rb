class CourseWebView < UIWebView
  include CCAutoLayoutView

  def init
    super

    self.delegate = self
    self.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString('http://google.com')
      )
    )

    self
  end
end
