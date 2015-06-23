module Footer
  class SignInMethodController < UIViewController
    def loadView
      self.view = Footer::SignInMethodView.alloc.init_with_fb_delegate(self)
    end

    def loginButton(login_button, didCompleteWithResult: result, error: _error)
      puts 'User Logged In'

      if _error != nil
        puts _error.localizedRecoverySuggesstion
      elsif result.isCancelled
        puts 'Cancelled'
      end
    end

    def loginButtonDidLogOut(login_button)
      puts 'User logged out'
    end
  end
end
