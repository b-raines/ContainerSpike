class AppContainerController < UIViewController
  include ContainerController

  def prefersStatusBarHidden; true; end

  def init
    super

    self.title = 'ContainerSpike'
    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.display_content_controller(@web_view_controller = ContentWebViewController.new)
    self.display_content_controller(@footer_controller = Footer::FooterContainerController.new)

    add_constraints
  end

  def add_constraints
    web_view = @web_view_controller.view
    footer_view = @footer_controller.view

    constraints = NSLayoutConstraint.constraintsWithVisualFormat(
      'V:|[webView][footerView]|',
      options: 0,
      metrics: nil,
      views: { 'webView' => web_view, 'footerView' => footer_view }
    )

    self.view.addConstraints(constraints)
  end
end
