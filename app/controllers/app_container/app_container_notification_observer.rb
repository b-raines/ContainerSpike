module AppContainerNotificationObserver
  include NotificationObserver::Base

  def register_observations
    Event.subscribe(self, 'DismissContent')
  end

  def dismiss_content(notification)
    if top_view_controller
      update_controllers(top: nil)
    else
      update_controllers(top: ContentWebViewController.new)
    end
  end
end
