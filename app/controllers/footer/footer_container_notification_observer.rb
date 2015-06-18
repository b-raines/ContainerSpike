module FooterContainerNotificationObserver
  include NotificationObserver::Base

  def register_observations
    Event.subscribe(self, 'StartTrial')
    Event.subscribe(self, 'SignOut')
  end

  def start_trial(notification)
    cycle_from_view_controller(enroll_controller, to_controller: status_controller)
  end

  def sign_out(notification)
    cycle_from_view_controller(status_controller, to_controller: enroll_controller)
  end
end
