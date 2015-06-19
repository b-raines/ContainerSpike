class AppContainerController < UIViewController
  include NoNavBar
  include ContainerController
  include AppContainerNotificationObserver

  attr_reader \
    :top_view_controller,
    :bottom_view_controller

  def prefersStatusBarHidden; true; end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.display_content_controller(top_nav_controller)
    self.display_content_controller(footer_controller)
    add_constraints
  end

  private

  def top_nav_controller
    @top_nav_controller ||= ContentNavigationManager.navigation_controller
  end

  def footer_controller
    @footer_controller ||= Footer::FooterContainerController.new
  end

  def add_constraints
    top_view    = top_nav_controller.view
    footer_view = footer_controller.view

    _constraints = []

    _constraints += CCLayout.new(
      top_view,
      margin: [0],
      bottom_view: footer_view,
    ).constraints

    _constraints += CCLayout.new(
      footer_view,
      margin: [0],
      top_view: top_view,
    ).constraints

    self.view.addConstraints(_constraints)
  end
end
