class CCPasswordField < CCTextField
  attr_reader :secure, :hide_pw_button

  def init
    super

    @secure = false

    self.keyboardType = UIKeyboardTypeASCIICapable
    self.placeholder = 'password'
    self.rightViewMode = UITextFieldViewModeAlways
    @hide_pw_button = HidePasswordButton.new(secure)
    hide_pw_button.addTarget(self, action: 'toggle_secure_text', forControlEvents: UIControlEventTouchUpInside)
    self.rightView = hide_pw_button

    self
  end

  def toggle_secure_text
    self.secureTextEntry = !secure
    hide_pw_button.toggle(@secure = !secure)
    self.resignFirstResponder
    self.becomeFirstResponder
  end

  class HidePasswordButton < UIButton
    include CCAutoLayoutView

    def initialize(secure = false)
      _button = init

      _button.width = 60
      _button.setTitleColor(CCColor.color_with_hex('#D8D8D8'), forState: UIControlStateNormal)
      _button.addSubview(Border.new(:left))
      _button.titleLabel.font = CCFont.proxima_semibold(size: 14)

      _button.toggle(secure)
    end

    def toggle(secure)
      if secure
        self.setTitle('SHOW', forState: UIControlStateNormal)
      else
        self.setTitle('HIDE', forState: UIControlStateNormal)
      end
    end
  end
end
