class CCContentNavigationController < CCNavigationController
  def init
    super

    self.view.translatesAutoresizingMaskIntoConstraints = false

    self
  end

  def slide_up_view_controller(view_controller)
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    transition.type = KCATransitionMoveIn
    transition.subtype = KCATransitionFromTop

    self.view.layer.addAnimation(transition, forKey: nil)
    self.pushViewController(view_controller, animated: false)
  end

  def slide_down_view_controller
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    transition.type = KCATransitionReveal
    transition.subtype = KCATransitionFromBottom

    self.view.layer.addAnimation(transition, forKey: nil)
    self.popViewControllerAnimated(false)
  end
end
