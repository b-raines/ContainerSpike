class ContentWebViewController < UIViewController
  include ContainerContentController

  def loadView
    self.view = ContentWebView.new
  end
end
