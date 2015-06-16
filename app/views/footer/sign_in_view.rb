module Footer
  class SignInView < UIView
    include ContainerContentView

    def init
      super

      self.translatesAutoresizingMaskIntoConstraints = false
      self.gutter = 90
      add_sign_in_button

      self
    end

    def add_sign_in_button
      @sign_in_button ||= CCButton.alloc.init_with_title('Start Today')

      self.addSubview(sign_in_button)
      self.addConstraints(button_constraints)

      tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget(
        self,
        action: 'sign_in'
      )

      sign_in_button.addGestureRecognizer(tap_recognizer)
    end

    def sign_in
      NSNotificationCenter.defaultCenter.postNotificationName('SignIn', object: self)
    end

    protected

    attr_reader :sign_in_button

    private

    def button_constraints
      _constraints = []
      metrics = {
        'vMargin' => 10,
      }

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'V:|-vMargin-[button(50)]-vMargin-|',
        options: 0,
        metrics: metrics,
        views: { 'button' => sign_in_button }
      )

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'H:|-[button]-|',
        options: 0,
        metrics: metrics,
        views: { 'button' => sign_in_button }
      )

      _constraints
    end
  end
end
