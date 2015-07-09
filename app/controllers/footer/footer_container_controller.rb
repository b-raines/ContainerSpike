module Footer
  class FooterContainerController < UIViewController
    include ContainerController
    include FooterContainerNotificationObserver

    def loadView
      self.view = Footer::FooterContainerView.new
    end

    def viewDidLoad
      self.display_content_controller(enroll_controller)
    end

    def height
      visible_view_controller.view.height || DEFAULT_FOOTER_HEIGHT
    end

    private

    def enroll_controller
      @enroll_controller ||= Footer::EnrollController.alloc.init
    end

    def sign_in_controller
      @sign_in_controller ||= Footer::SignInController.alloc.init
    end

    def sign_in_method_controller
      @sign_in_method_controller ||= Footer::SignInMethodController.alloc.init
    end
  end
end
