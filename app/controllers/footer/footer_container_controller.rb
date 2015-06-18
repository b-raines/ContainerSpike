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

    private

    def enroll_controller
      @enroll_controller ||= Footer::EnrollController.new
    end

    def status_controller
      @status_controller ||= Footer::StatusController.new
    end
  end
end
