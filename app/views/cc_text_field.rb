class CCTextField < UITextField
  def init
    super
    self.translatesAutoresizingMaskIntoConstraints = false
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 3
    self.layer.borderColor = UIColor.colorWithRed(0.882, green: 0.882, blue: 0.882, alpha: 1).CGColor
    self.backgroundColor = UIColor.whiteColor
    self.returnKeyType = UIReturnKeyDone
    self
  end
end
