class CCNavigationController < UINavigationController
  # Defer orientation and status bar color to top-most controller

  def init
    super

    self.view.translatesAutoresizingMaskIntoConstraints = false

    self
  end

  def shouldAutorotate
    topViewController.shouldAutorotate
  end

  def supportedInterfaceOrientations
    topViewController.supportedInterfaceOrientations
  end

  def preferredInterfaceOrientationForPresentation
    topViewController.preferredInterfaceOrientationForPresentation
  end

  def shouldAutorotateToInterfaceOrientation(interface_orientation)
    topViewController.shouldAutorotateToInterfaceOrientation(interface_orientation)
  end

  def childViewControllerForStatusBarStyle
    topViewController
  end

  def childViewControllerForStatusBarHidden
    topViewController
  end

  def pushFadeViewController(view_controller)
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    transition.type = KCATransitionFade

    self.view.layer.addAnimation(transition, forKey: nil)

    self.pushViewController(view_controller, animated: false)
  end

  def fadePopViewController
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    transition.type = KCATransitionFade

    self.view.layer.addAnimation(transition, forKey: nil)

    self.popViewControllerAnimated(false)
  end

  def slide_up_view_controller(view_controller)
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionLinear)
    transition.type = KCATransitionMoveIn
    transition.subtype = KCATransitionFromTop

    self.view.layer.addAnimation(transition, forKey: nil)
    self.pushViewController(view_controller, animated: false)
  end

  def slide_down_view_controller
    transition = CATransition.animation
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionLinear)
    transition.type = KCATransitionReveal
    transition.subtype = KCATransitionFromBottom

    self.view.layer.addAnimation(transition, forKey: nil)
    self.popViewControllerAnimated(false)
  end
end
