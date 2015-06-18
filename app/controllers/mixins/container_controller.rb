module ContainerController
  def display_content_controller(content)
    self.addChildViewController(content)
    self.view.addSubview(content.view)
    content.didMoveToParentViewController(self)
  end

  def hide_content_controller(content)
    content.willMoveToParentViewController(nil)
    content.view.removeFromSuperview
    content.removeFromParentViewController
  end

  def cycle_from_view_controller(from_controller, opts = {})
    return if !opts[:to_controller]

    to_controller = opts[:to_controller]
    animated = opts.fetch(:animated, true)
    hide_content_controller(from_controller)
    display_content_controller(to_controller)
    root_view = self.view.superview || self.view

    if animated
      UIView.animateWithDuration(
        0.4,
        delay: 0,
        options: UIViewAnimationOptionCurveEaseInOut,
        animations: ->() {
          root_view.layoutIfNeeded
        },
        completion: ->(finished) {}
      )
    else
      self.view.layoutIfNeeded
    end
  end
end
