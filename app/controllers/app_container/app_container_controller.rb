class AppContainerController < UIViewController
  include NoNavBar
  include ContainerController
  include AppContainerNotificationObserver

  attr_reader \
    :top_view_controller,
    :bottom_view_controller

  def childViewControllerForStatusBarStyle
    top_nav_controller
  end

  def childViewControllerForStatusBarHidden
    top_nav_controller
  end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.display_content_controller(top_nav_controller)
    self.display_content_controller(footer_controller)
    updateConstraints
  end

  def updateConstraints
    top_view    = top_nav_controller.view
    footer_view = footer_controller.view

    _constraints = []

    _constraints += CCLayout.new(
      top_view,
      margin: [0, 0, footer_height, 0]
    ).constraints

    _constraints += CCLayout.new(
      footer_view,
      margin: [nil, 0, 0, 0]
    ).constraints

    self.view.addConstraints(_constraints)
  end

  private

  def footer_height
    Footer::FooterView::DEFAULT_FOOTER_HEIGHT
  end

  def top_nav_controller
    @top_nav_controller ||= ContentNavigationManager.navigation_controller
  end

  def footer_controller
    @footer_controller ||= Footer::FooterContainerController.new
  end
end
