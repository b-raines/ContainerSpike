class AccountSetupView < UIView
  include CCAutoLayoutView

  GUTTER = 60

  def init
    super

    add_fields
    self.margin = [0]
    self.backgroundColor = UIColor.whiteColor
    TapEvent.new(next_button, 'SignInOrSignUp').register
    TapEvent.new(back_button, 'WillDismissSignIn').register

    self
  end

  def email
    email_field.text
  end

  def password
    password_field.text
  end

  protected

  attr_reader :label, :back_button, :email_field, :password_field, :next_button

  private

  def add_fields
    self.addSubview(
      @label = CCLabel.alloc.init_with_options(
        text: "We'll create an account for you if you don't already have one.",
        color: CCColor.color_with_hex('#A8A8A8'),
        font: CCFont.proxima_light(size: 16.5)
      )
    )
    self.addSubview(@email_field = CCEmailField.alloc.init)
    self.addSubview(@password_field = CCPasswordField.alloc.init)
    self.addSubview(@next_button = CCButton.alloc.init_with_title('Next', disabled: true))
    self.addSubview(@back_button = CCButton.alloc.init_with_image('down_arrow_gray.png'))

    password_field.autocorrectionType = false
  end

  def subview_constraints
    _constraints = []

    _constraints += CCLayout.new(
      back_button,
      height: 40,
      width: 40,
      margin_top: 47,
      margin_left: (GUTTER - 40) / 2
    ).constraints

    _constraints += CCLayout.new(
      label,
      bottom_view: email_field,
      margin: [50, GUTTER, 30, GUTTER],
    ).constraints

    _constraints += CCLayout.new(
      email_field,
      top_view: label,
      bottom_view: password_field,
      margin: [nil, GUTTER, 20, GUTTER],
      height: 50,
    ).constraints

    _constraints += CCLayout.new(
      password_field,
      top_view: email_field,
      bottom_view: next_button,
      margin: [20, GUTTER],
      height: 50,
    ).constraints

    _constraints += CCLayout.new(
      next_button,
      top_view: password_field,
      margin: [20, GUTTER, nil, GUTTER],
      height: 50,
      align: :center
    ).constraints

    _constraints
  end
end
