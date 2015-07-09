module FooterContainerNotificationObserver
  include NotificationObserver::Base

  def register_persistent_observations
    Event.subscribe(self, 'StartTrial')
    Event.subscribe(self, 'WillNavigateToCourseView')
    Event.subscribe(self, 'WillDismissCourseView')
    Event.subscribe(self, 'WillNavigateToPreviousFooterState')
  end

  private

  def start_trial(notification)
    navigate_to(sign_in_method_controller)
  end

  def will_navigate_to_course_view(notification)
    navigate_to(enroll_controller)
  end

  def will_dismiss_course_view(notification)
    navigate_to(sign_in_controller)
  end

  def will_navigate_to_previous_footer_state(notification)
    go_back
  end

  def go_back
    navigate_to(view_controllers[-2])
  end

  def navigate_to(controller)
    cycle_from_view_controller(visible_view_controller, to_controller: controller)
  end
end
