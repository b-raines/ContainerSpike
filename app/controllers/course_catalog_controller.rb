class CourseCatalogController < UIViewController
  include NoNavBar
  include NotificationObserver::Base

  def loadView
    self.view = CourseCatalogView.new
  end

  def navigate_to_course(notification)
    ContentNavigationManager.navigate_to(CourseWebViewController.alloc.init)
  end

  def register_observations
    Event.subscribe(self, 'NavigateToCourse')
  end
end
