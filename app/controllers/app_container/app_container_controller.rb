class AppContainerController < UIViewController
  include ContainerController
  include AppContainerNotificationObserver

  attr_accessor \
    :top_view_controller,
    :bottom_view_controller

  def prefersStatusBarHidden; true; end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.update_controllers(
      top: ContentWebViewController.new,
      bottom: Footer::FooterContainerController.new
    )
  end

  def update_controllers(controllers)
    update_top_controller(controllers.fetch(:top, top_view_controller))
    update_bottom_controller(controllers.fetch(:bottom, bottom_view_controller))

    self.view.addConstraints(layout_constraints)
  end

  def update_top_controller(controller)
    if top_view_controller && controller
      if top_view_controller != controller
        cycle_from_view_controller(top_view_controller, to_controller: controller)
      end
    elsif controller
      display_content_controller(controller)
    elsif top_view_controller
      hide_content_controller(top_view_controller)
    end

    self.top_view_controller = controller
  end

  def update_bottom_controller(controller)
    if bottom_view_controller && controller
      if bottom_view_controller != controller
        cycle_from_view_controller(bottom_view_controller, to_controller: controller)
      end
    elsif controller
      display_content_controller(controller)
    elsif bottom_view_controller
      hide_content_controller(bottom_view_controller)
    end

    self.bottom_view_controller = controller
  end

  def layout_constraints
    top_view     = top_view_controller ? top_view_controller.view : nil
    bottom_view  = bottom_view_controller ? bottom_view_controller.view : nil
    _constraints = []

    if bottom_view
      margin = top_view ? [0] : [nil, 0, 0, 0]
      _constraints += CCLayout.new(
        bottom_view,
        margin: margin,
        top_view: top_view,
      ).constraints
    end

    if top_view
      margin = bottom_view ? [0] : [0, 0, nil, 0]
      _constraints += CCLayout.new(
        top_view,
        margin: [0],
        bottom_view: bottom_view,
      ).constraints
    end

    _constraints
  end
end
