class ContentWebViewController < UIViewController
  def loadView
    self.view = ContentWebView.new
  end
end
