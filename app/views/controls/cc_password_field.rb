class CCPasswordField < CCTextField
  def init
    super

    self.secureTextEntry = true
    self.placeholder = 'Password'

    self
  end
end
