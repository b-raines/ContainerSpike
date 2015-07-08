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

    if animated
      animate_controller_dismissal(from_controller, opts[:to_controller])
    else
      hide_content_controller(from_controller)
      display_content_controller(opts[:to_controller])
      self.view.layoutIfNeeded
    end
  end

  def animate_controller_dismissal(controller, to_controller = nil)
    UIView.animateWithDuration(
      0.2,
      delay: 0,
      options: UIViewAnimationOptionCurveLinear,
      animations: ->() {
        self.view.frame = [[0, screen_height], [screen_width, 0]]
      },
      completion: ->(finished) {
        hide_content_controller(controller)
        animate_controller_presentation(to_controller) if to_controller
      }
    )
  end

  def animate_controller_presentation(vc)
    display_content_controller(vc)
    UIView.animateWithDuration(
      0.2,
      delay: 0,
      options: UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionOverrideInheritedDuration | UIViewAnimationOptionLayoutSubviews,
      animations: ->() {
        self.view.layoutIfNeeded
      },
      completion: ->(finished) {}
    )
  end

  def visible_view_controller
    view_controllers[-1]
  end

  def root_view_controller
    view_controllers[0]
  end

  def screen_width
    UIScreen.mainScreen.bounds.size.width
  end

  def screen_height
    UIScreen.mainScreen.bounds.size.height
  end
end
