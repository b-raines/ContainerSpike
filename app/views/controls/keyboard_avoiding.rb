module KeyboardAvoiding
  def init
    super

    register_keyboard_observations

    self
  end

  def keyboard_will_show(notification)
    UIView.animateWithDuration(
      keyboard_animation_duration_for_notification(notification),
      animations: ->() {
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboard_y_offset_for_notification(notification))
      },
      completion: ->(finished) {}
    )
  end

  def keyboard_will_hide(notification)
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
    Event.subscribe(self, UIKeyboardWillShowNotification, selector: 'keyboard_will_show:')
    Event.subscribe(self, UIKeyboardWillHideNotification, selector: 'keyboard_will_hide:')
  end

  def dealloc
    Event.unsubscribe(self)

    super
  end
end
