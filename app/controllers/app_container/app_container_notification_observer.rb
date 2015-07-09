module AppContainerNotificationObserver
  include NotificationObserver::Base

  def register_persistent_observations
    Event.subscribe(self, 'WillDismissCourseView')
    Event.subscribe(self, 'WillShowSignIn')
    Event.subscribe(self, 'WillDismissSignIn')
  end

  def will_dismiss_course_view(notification)
    ContentNavigationManager.pop
  end

  def will_show_sign_in(notification)
    account_setup_controller = AccountSetupController.alloc.init
    vc = CCNavigationController.alloc.initWithRootViewController(account_setup_controller)
    presentViewController(vc, animated: true, completion: nil)
  end

  def will_dismiss_sign_in(notification)
    dismissViewControllerAnimated(true, completion: nil)
  end
end
