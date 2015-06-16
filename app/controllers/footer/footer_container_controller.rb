module Footer
  class FooterContainerController < UIViewController
    include ContainerController
    include ContainerContentController
    include KeyboardAvoiding

    def viewWillAppear(animated)
      super

      register_observations
    end

    def viewWillDisappear(animated)
      super

      NSNotificationCenter.defaultCenter.removeObserver(self)
    end

    def loadView
      self.view = Footer::FooterContainerView.new
    end

    def viewDidLoad
      self.display_content_controller(sign_in_controller)
    end

    def dealloc
      NSNotificationCenter.defaultCenter.removeObserver(self)
      super
    end

    private

    def sign_in
      cycle_from_view_controller(sign_in_controller, to_controller: status_controller)
    end

    def sign_out
      cycle_from_view_controller(status_controller, to_controller: sign_in_controller)
    end

    def sign_in_controller
      @sign_in_controller ||= Footer::SignInController.new
    end

    def status_controller
      @status_controller ||= Footer::StatusController.new
    end

    def register_observations
      register_observation('sign_in', 'SignIn')
      register_observation('sign_out', 'SignOut')
    end

    def register_observation(selector, name)
      NSNotificationCenter.defaultCenter.addObserver(
        self,
        selector: selector,
        name: name,
        object: nil
      )
    end
  end
end