module Footer
  class CourseController < UIViewController
    def loadView
      self.view = current_view
    end

    def update_view_for_user_state
      self.view = current_view
      self.view.layoutIfNeeded
    end

    def current_view
      if SessionManager.auth_token
        Footer::SignedIn::CourseView.new
      else
        Footer::NotSignedIn::CourseView.new
      end
    end
  end
end
