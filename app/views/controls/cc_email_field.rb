class CCEmailField < CCTextField
  def init
    super

    self.keyboardType = UIKeyboardTypeEmailAddress
    self.autocorrectionType = UITextAutocorrectionTypeNo
    self.autocapitalizationType = UITextAutocapitalizationTypeNone
    self.placeholder = 'email'

    self
  end
end
