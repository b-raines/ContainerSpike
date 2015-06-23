module AppContainerNotificationObserver
  include NotificationObserver::Base

  def register_observations
    Event.subscribe(self, 'WillDismissCourseView')
  end

  def will_dismiss_course_view(notification)
    ContentNavigationManager.pop
  end
end
