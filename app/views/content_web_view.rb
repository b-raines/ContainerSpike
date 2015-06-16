class ContentWebView < UIWebView
  include ContainerContentView

  def init
    super

    self.delegate = self
    self.translatesAutoresizingMaskIntoConstraints = false
    self.loadRequest(
      NSURLRequest.requestWithURL(
        NSURL.URLWithString('http://google.com')
      )
    )

    self
  end

  def constraints
    layout_constraints(top: true)
  end
end
