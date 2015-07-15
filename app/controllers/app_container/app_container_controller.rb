class AppContainerController < UIViewController
  include NoNavBar
  include ContainerController
  include AppContainerNotificationObserver

  def childViewControllerForStatusBarStyle
    content_controller
  end

  def childViewControllerForStatusBarHidden
    content_controller
  end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.display_content_controller(content_controller)
    self.display_content_controller(footer_controller)
    self.view.addConstraints(footer_constraints)
  end

  def footer_constraints
    CCLayout.new(
      footer_controller.view,
      margin: [nil, 0, 0, 0]
    ).constraints
  end

  private

  def content_controller
    @content_controller ||= ContentNavigationManager.navigation_controller
  end

  def footer_controller
    @footer_controller ||= Footer::FooterContainerController.new
  end
end
