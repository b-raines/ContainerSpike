module Footer
  class AccountSetupView < UIView
    include CCAutoLayoutView

    def init
      super

      self.margin = [0]
      add_fields

      self
    end

    protected

    attr_reader :email_field, :password_field, :next_button

    private

    def add_fields
      self.addSubview(@email_field = CCEmailField.alloc.init)
      self.addSubview(@password_field = CCPasswordField.alloc.init)
      self.addSubview(@next_button = CCButton.alloc.init_with_title('Next'))
      self.addConstraints(subview_constraints)
      TapEvent.new(next_button, 'SignInOrSignUp').register
    end

    def subview_constraints
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
        bottom_view: next_button,
        margin: [20],
        height: 50
      ).constraints

      _constraints += CCLayout.new(
        next_button,
        top_view: password_field,
        margin_top: 20,
        height: 50,
        width: 150,
        align: :center
      ).constraints

      _constraints
    end
  end
end
