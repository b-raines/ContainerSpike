class CCButton < UIButton
  include CCAutoLayoutView

  def init_with_title(title)
    init

    self.layer.cornerRadius = 4
    self.layer.masksToBounds = true
    self.backgroundColor = UIColor.colorWithRed(0.353, green:0.859, blue:0.604, alpha:1)
    self.setTitle(title, forState: UIControlStateNormal)
    self.setTitle(title, forState: UIControlStateDisabled)
    self.setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)
    self.setTitleColor(UIColor.whiteColor, forState: UIControlStateDisabled)

    self
  end
end
