module FooterContainerNotificationObserver
  include NotificationObserver::Base

  def register_persistent_observations
    Event.subscribe(self, 'StartTrial')
    Event.subscribe(self, 'WillNavigateToCourseView')
    Event.subscribe(self, 'WillDismissCourseView')
    Event.subscribe(self, 'WillNavigateToPreviousFooterState')
    Event.subscribe(self, 'UserSignedIn')
    Event.subscribe(self, 'WillViewArticle')
    Event.subscribe(self, 'WillViewNextArticle')
    Event.subscribe(self, 'WillDismissArticle')
  end

  private

  # User Sign in/out

  def user_signed_in(notification)
    update_controller_views_for_user_state
    navigate_to(course_controller)
  end

  def user_signed_out(notification)
    update_controller_views_for_user_state
  end

  def start_trial(notification)
    navigate_to(sign_in_method_controller)
  end

  # Course Home

  def will_navigate_to_course_view(notification)
    navigate_to(course_controller)
  end

  def will_dismiss_course_view(notification)
    navigate_to(catalog_controller)
  end

  # Articles

  def will_view_article(notification)
    navigate_to(article_controller)
  end

  def will_view_next_article(notification)
    puts 'NEXT ARTICLE'
  end

  def will_dismiss_article(notification)
    ContentNavigationManager.pop_to_root
    navigate_to(course_controller)
  end

  # Navigation & View Updating for User State

  def will_navigate_to_previous_footer_state(notification)
    go_back
  end

  def update_controller_views_for_user_state
    view_controllers.each { |vc| vc.update_view_for_user_state if vc.respond_to?(:update_view_for_user_state) }
  end

  def go_back
    navigate_to(view_controllers[-2])
  end

  def navigate_to(controller)
    cycle_from_view_controller(visible_view_controller, to_controller: controller)
  end
end
