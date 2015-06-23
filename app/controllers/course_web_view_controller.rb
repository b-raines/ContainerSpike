class CourseWebViewController < CCWebViewController
  include NoNavBar

  def prefersStatusBarHidden; true; end

  def loadView
    self.view = CourseWebView.new
  end
end
