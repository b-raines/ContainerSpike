module ContainerController
  def display_content_controller(content, opts = {})
    self.addChildViewController(content)
    display_view(content, opts[:animated])
  end

  def hide_content_controller(content, opts = {})
    content.willMoveToParentViewController(nil)
    hide_view(content, opts[:animated])
  end

  def cycle_from_view_controller(from_controller, opts = {})
    return if !opts[:to_controller]

    hide_content_controller(from_controller)
    display_content_controller(opts[:to_controller])
    perform_view_transition(opts.fetch(:animated, true)) do
      root_view.layoutIfNeeded
    end
  end

  private

  def display_view(content, animated)
    if animated
      UIView.transitionWithView(
        self.view,
        duration: 0.4,
        options: UIViewAnimationOptionLayoutSubviews,
        animations: ->() {
          self.view.addSubview(content.view)
        },
        completion: ->(finished) {
          content.didMoveToParentViewController(self)
        }
      )
    else
      self.view.addSubview(content.view)
      content.didMoveToParentViewController(self)
    end
  end

  def hide_view(content, animated)
    if animated
      UIView.transitionWithView(
        self.view,
        duration: 0.4,
        options: UIViewAnimationOptionLayoutSubviews,
        animations: ->() {
          content.view.removeFromSuperview
        },
        completion: ->(finished) {
          content.removeFromParentViewController
        }
      )
    else
      content.view.removeFromSuperview
      content.removeFromParentViewController
    end
  end

  def perform_view_transition(animated)
    if animated
      UIView.animateWithDuration(
        0.4,
        delay: 0,
        options: UIViewAnimationOptionCurveEaseInOut,
        animations: ->() {
          yield if block_given?
        },
        completion: ->(finished) {}
      )
    else
      yield if block_given?
    end
  end

  def root_view
    self.view.superview || self.view
  end
end
