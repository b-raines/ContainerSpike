class CCPhoneField < SHSPhoneTextField
  def initialize(opts = {})
    _field = init

    _field.placeholder = opts.fetch(:placeholder, '')
  end

  def init
    super
    self.translatesAutoresizingMaskIntoConstraints = false
    self.formatter.setDefaultOutputPattern('(###) ###-####')
    self.formatter.prefix = '+1 '
    self.paddingLeft = 10
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 3
    self.layer.borderColor = CCColor.light_gray.CGColor
    self.backgroundColor = UIColor.whiteColor
    self.textDidChangeBlock = lambda { |phone_number_field|
      NSNotificationCenter.defaultCenter.postNotificationName(
        'TextDidChange',
        object: phone_number_field
      )
    }
    self
  end
end
