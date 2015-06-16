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

    animated = opts.fetch(:animated, true)
    hide_content_controller(from_controller)
    display_content_controller(opts[:to_controller])

    if animated
      UIView.animateWithDuration(
        0.5,
        delay: 0,
        usingSpringWithDamping: 0.75,
        initialSpringVelocity: 0.5,
        options: 0,
        animations: ->() {
          self.view.layoutIfNeeded
        },
        completion: ->(finished) {
        }
      )
    end
  end
end
