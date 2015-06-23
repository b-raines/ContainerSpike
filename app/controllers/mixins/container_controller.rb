module ContainerController
  attr_accessor :view_controllers

  def init
    super

    self.view_controllers = []

    self
  end

  def display_content_controller(content)
    self.addChildViewController(content)
    self.view.addSubview(content.view)
    content.didMoveToParentViewController(self)

    self.view_controllers.delete(content)
    self.view_controllers << content
  end

  def hide_content_controller(content)
    content.willMoveToParentViewController(nil)
    content.view.removeFromSuperview
    content.removeFromParentViewController
  end

  def cycle_from_view_controller(from_controller, opts = {})
    return if !opts[:to_controller]

    animated = opts.fetch(:animated, true)
    hide_content_controller(from_controller)
    display_content_controller(opts[:to_controller])

    if animated
      UIView.animateWithDuration(
        0.3,
        delay: 0,
        options: UIViewAnimationOptionCurveLinear,
        animations: ->() {
          root_view.layoutIfNeeded
        },
        completion: ->(finished) {}
      )
    else
      root_view.layoutIfNeeded
    end
  end

  def root_view
    self.view.superview || self.view
  end

  def visible_view_controller
    view_controllers[-1]
  end

  def root_view_controller
    view_controllers[0]
  end
end
