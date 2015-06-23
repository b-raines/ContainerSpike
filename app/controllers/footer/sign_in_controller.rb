module Footer
  class SignInController < UIViewController
    def loadView
      self.view = Footer::SignInView.new
    end
  end
end
