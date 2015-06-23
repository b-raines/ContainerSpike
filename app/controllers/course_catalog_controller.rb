class CourseCatalogController < UIViewController
  include NoNavBar
  include NotificationObserver::Base

  def prefersStatusBarHidden; false; end

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  def loadView
    self.view = CourseCatalogView.new
  end

  def navigate_to_course(notification)
    web_view_controller.preload
  end

  def webViewDidFinishLoad(web_view)
    Event.trigger('WillNavigateToCourseView')
    ContentNavigationManager.navigate_to(web_view_controller)
  end

  def web_view_controller
    @web_view_controller ||= CourseWebViewController.alloc.init_with_delegate(self)
  end

  def register_observations
    Event.subscribe(self, 'NavigateToCourse')
  end
end
