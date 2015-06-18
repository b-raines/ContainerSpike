class CCTextField < UITextField
  include CCAutoLayoutView

  def init
    super
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 3
    self.layer.borderColor = CCColor.light_gray.CGColor
    self.backgroundColor = UIColor.whiteColor
    self.returnKeyType = UIReturnKeyDone
    self
  end
end
