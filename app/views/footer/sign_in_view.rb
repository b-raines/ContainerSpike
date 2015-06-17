module Footer
  class SignInView < UIView
    include CCAutoLayoutView

    def init
      super

      self.margin = [0]
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

    def layout_constraints
      CCLayoutConstraints.new(
        self
      ).constraints
    end

    protected

    attr_reader :sign_in_button

    private

    def button_constraints
      CCLayoutConstraints.new(
        sign_in_button,
        margin: [10, nil],
        height: 50,
        width: 150,
        align: :center
      ).constraints
    end
  end
end
