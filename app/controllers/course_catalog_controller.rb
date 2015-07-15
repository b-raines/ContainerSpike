class CourseCatalogController < UIViewController
  include NoNavBar
  include NotificationObserver::Base

  def prefersStatusBarHidden; false; end

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  def init
    super

    web_view_controller.load_url

    self
  end

  def loadView
    self.view = CourseCatalogView.new
  end

  def web_view_controller
    @web_view_controller ||= CCWebViewController.alloc.init_with_delegate(self)
  end

  def will_navigate_to_course_view(notification)
    ContentNavigationManager.navigate_to(web_view_controller)
  end

  def register_observations
    super

    Event.subscribe(self, 'WillNavigateToCourseView')
  end
end
