module Footer
  class StatusView < UIView
    include ContainerContentView

    def init
      super

      self.translatesAutoresizingMaskIntoConstraints = false
      self.gutter = 60
      add_tap_recognizer
      add_fields

      self
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
      metrics = {
        'vMargin' => 20,
        'hMargin' => 60,
        'textFieldHeight' => 50,
        'buttonWidth' => 150
      }
      views = {
        'emailField' => email_field,
        'passwordField' => password_field,
        'signUpButton' => sign_up_button
      }

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'V:|-vMargin-[emailField(textFieldHeight)]-vMargin-[passwordField(==emailField)]-vMargin-[signUpButton(==emailField)]-vMargin-|',
        options: 0,
        metrics: metrics,
        views: views
      )

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'H:|[emailField]|',
        options: 0,
        metrics: metrics,
        views: views
      )

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'H:|[passwordField]|',
        options: 0,
        metrics: metrics,
        views: views
      )

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'H:[signUpButton(buttonWidth)]',
        options: 0,
        metrics: metrics,
        views: views
      )

      _constraints << NSLayoutConstraint.constraintWithItem(
        sign_up_button,
        attribute: NSLayoutAttributeCenterX,
        relatedBy: NSLayoutRelationEqual,
        toItem: self,
        attribute: NSLayoutAttributeCenterX,
        multiplier: 1,
        constant: 0
      )

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
