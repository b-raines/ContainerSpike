class CCNavigationController < UINavigationController
  # Defer orientation and status bar color to top-most controller

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

  def preferredStatusBarStyle
    topViewController.preferredStatusBarStyle
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
end
