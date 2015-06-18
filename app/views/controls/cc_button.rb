class CCButton < UIButton
  include CCAutoLayoutView

  def init_with_title(title)
    init

    self.layer.cornerRadius = 4
    self.layer.masksToBounds = true
    self.backgroundColor = CCColor.call_to_action
    self.setTitle(title, forState: UIControlStateNormal)
    self.setTitle(title, forState: UIControlStateDisabled)
    self.setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)
    self.setTitleColor(UIColor.whiteColor, forState: UIControlStateDisabled)

    self
  end

  def init_with_image(image)
    init

    self.setImage(UIImage.imageNamed(image), forState: UIControlStateNormal)

    self
  end
end
