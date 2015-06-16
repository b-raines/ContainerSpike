module Footer
  class SignInController < UIViewController
    include ContainerContentController

    def loadView
      self.view = Footer::SignInView.new
    end
  end
end
