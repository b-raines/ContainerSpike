class CoachIntroView < UIView
  include CCAutoLayoutView

  GUTTER = 60

  def init
    super

    add_fields
    self.margin = [0]
    self.backgroundColor = UIColor.whiteColor
    TapEvent.new(sign_in_button, 'WillDismissSignIn').register
    TapEvent.new(back_button, 'DismissCoachIntro').register

    self
  end

  protected

  attr_reader :label, :name_field, :phone_field, :sign_in_button, :back_button

  private

  def add_fields
    self.addSubview(
      @label = CCLabel.alloc.init_with_options(
        text: "Allow your coach to reach you via text message.",
        color: CCColor.color_with_hex('#A8A8A8'),
        font: CCFont.proxima_light(size: 16.5)
      )
    )
    self.addSubview(@name_field = CCTextField.new(placeholder: 'name'))
    self.addSubview(@phone_field = CCPhoneField.new(placeholder: 'phone number'))
    self.addSubview(@sign_in_button = CCButton.alloc.init_with_title('Sign In', disabled: true))
    self.addSubview(@back_button = CCButton.alloc.init_with_image('back_arrow_gray.png'))

    name_field.autocapitalizationType = UITextAutocapitalizationTypeWords
  end

  def subview_constraints
    _constraints = []

    _constraints += CCLayout.new(
      back_button,
      height: 40,
      width: 40,
      margin_top: 42,
      margin_left: (GUTTER - 40) / 2
    ).constraints

    _constraints += CCLayout.new(
      label,
      bottom_view: name_field,
      margin: [50, GUTTER, 30, GUTTER],
    ).constraints

    _constraints += CCLayout.new(
      name_field,
      top_view: label,
      bottom_view: phone_field,
      margin: [nil, GUTTER, 20, GUTTER],
      height: 50,
    ).constraints

    _constraints += CCLayout.new(
      phone_field,
      top_view: name_field,
      bottom_view: sign_in_button,
      margin: [20, GUTTER],
      height: 50,
    ).constraints

    _constraints += CCLayout.new(
      sign_in_button,
      top_view: phone_field,
      margin: [20, GUTTER, nil, GUTTER],
      height: 50,
      align: :center
    ).constraints

    _constraints
  end
end
