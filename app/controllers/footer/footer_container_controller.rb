module Footer
  class FooterContainerController < UIViewController
    include ContainerController
    include FooterContainerNotificationObserver

    def loadView
      self.view = Footer::FooterContainerView.new
    end

    def viewDidLoad
      self.display_content_controller(course_controller)
    end

    def height
      visible_view_controller.view.height || DEFAULT_FOOTER_HEIGHT
    end

    private

    def course_controller
      @course_controller ||= Footer::CourseController.alloc.init
    end

    def catalog_controller
      @catalog_controller ||= Footer::SignInController.alloc.init
    end

    def sign_in_method_controller
      @sign_in_method_controller ||= Footer::SignInMethodController.alloc.init
    end

    def article_controller
      @article_controller ||= Footer::ArticleController.alloc.init
    end
  end
end
