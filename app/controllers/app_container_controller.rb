class AppContainerController < UIViewController
  include ContainerController

  def prefersStatusBarHidden; true; end

  def init
    super

    self.title = 'ContainerSpike'
    self.view.backgroundColor = UIColor.whiteColor
    add_constraints

    self
  end

  def viewDidLoad
    self.display_content_controller(@web_view_controller = ContentWebViewController.new)
    self.display_content_controller(@footer_controller = Footer::FooterContainerController.new)
  end

  def add_constraints
    web_view    = @web_view_controller.view
    footer_view = @footer_controller.view

    _constraints = []

    _constraints += CCLayoutConstraints.new(
      web_view,
      bottom_view: footer_view,
    ).constraints

    _constraints += CCLayoutConstraints.new(
      footer_view,
      top_view: web_view,
    ).constraints

    self.view.addConstraints(_constraints)
  end
end
