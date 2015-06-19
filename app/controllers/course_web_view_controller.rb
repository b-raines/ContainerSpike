class CourseWebViewController < UIViewController
  include NoNavBar

  def loadView
    self.view = CourseWebView.new
  end
end
