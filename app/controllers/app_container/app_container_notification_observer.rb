module AppContainerNotificationObserver
  include NotificationObserver::Base

  def register_observations
    Event.subscribe(self, 'DismissContent')
  end

  def dismiss_content(notification)
    ContentNavigationManager.pop
  end
end
