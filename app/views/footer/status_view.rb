module Footer
  class StatusView < UIView
    include CCAutoLayoutView

    def init
      super

      self.margin = [nil, 0]
      add_tap_recognizer
      add_fields

      self
    end

    def layout_constraints
      CCLayout.new(
        self
      ).constraints
    end

    private

    def add_fields
      self.addSubview(email_field)
      self.addSubview(password_field)
      self.addSubview(sign_up_button)
      self.addConstraints(field_constraints)
    end

    def email_field
      @email_field ||= CCTextField.new.tap do |ef|
        ef.keyboardType = UIKeyboardTypeEmailAddress
        ef.autocorrectionType = UITextAutocorrectionTypeNo
        ef.autocapitalizationType = UITextAutocapitalizationTypeNone
        ef.placeholder = 'Email'
      end

      @email_field
    end

    def password_field
      @password_field ||= CCTextField.new.tap do |pf|
        pf.secureTextEntry = true
        pf.placeholder = 'Password'
      end

      @password_field
    end

    def sign_up_button
      @sign_up_button ||= CCButton.alloc.init_with_title('Sign Up')
    end

    def field_constraints
      _constraints = []

      _constraints += CCLayout.new(
        email_field,
        bottom_view: password_field,
        margin: [20],
        height: 50
      ).constraints

      _constraints += CCLayout.new(
        password_field,
        top_view: email_field,
        bottom_view: sign_up_button,
        margin: [20],
        height: 50
      ).constraints

      _constraints += CCLayout.new(
        sign_up_button,
        top_view: password_field,
        margin: [20, nil],
        height: 50,
        width: 150,
        align: :center
      ).constraints

      _constraints
    end

    def add_tap_recognizer
      tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget(
        self,
        action: 'sign_out'
      )

      sign_up_button.addGestureRecognizer(tap_recognizer)
    end

    def sign_out
      NSNotificationCenter.defaultCenter.postNotificationName('SignOut', object: self)
    end
  end
end
