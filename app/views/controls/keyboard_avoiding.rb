module KeyboardAvoiding
  def init
    super

    register_keyboard_observations

    self
  end

  def keyboardWillShow(notification)
    UIView.animateWithDuration(
      keyboard_animation_duration_for_notification(notification),
      animations: ->() {
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboard_y_offset_for_notification(notification))
      },
      completion: ->(finished) {}
    )
  end

  def keyboardWillHide(notification)
    UIView.animateWithDuration(
      keyboard_animation_duration_for_notification(notification),
      animations: ->() {
        self.view.transform = CGAffineTransformMakeTranslation(0, 0)
      },
      completion: ->(finished) {}
    )
  end

  private

  def keyboard_animation_duration_for_notification(notification)
    notification.userInfo.fetch(UIKeyboardAnimationDurationUserInfoKey, 0)
  end

  def keyboard_y_offset_for_notification(notification)
    notification.userInfo.fetch(UIKeyboardFrameEndUserInfoKey, CGRectZero).CGRectValue.size.height
  end

  def register_keyboard_observations
    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'keyboardWillShow:',
      name: UIKeyboardWillShowNotification,
      object: nil
    )

    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'keyboardWillHide:',
      name: UIKeyboardWillHideNotification,
      object: nil
    )
  end

  def dealloc
    NSNotificationCenter.defaultCenter.removeObserver(self)

    super
  end
end
