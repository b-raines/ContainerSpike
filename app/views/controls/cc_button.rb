class CCButton < UIButton
  include CCAutoLayoutView

  def init_with_title(title, opts = {})
    init

    self.layer.cornerRadius = 4
    self.layer.masksToBounds = true
    self.font = opts.fetch(:font, CCFont.proxima_regular)
    self.backgroundColor = opts.fetch(:background_color, CCColor.call_to_action)
    self.setTitle(title, forState: UIControlStateNormal)
    self.setTitle(title, forState: UIControlStateDisabled)
    self.setTitleColor(opts.fetch(:color, UIColor.whiteColor), forState: UIControlStateNormal)
    self.setTitleColor(opts.fetch(:disabled_color, UIColor.whiteColor), forState: UIControlStateDisabled)

    self
  end

  def init_with_image(image)
    init

    self.setImage(UIImage.imageNamed(image), forState: UIControlStateNormal)
    self.imageView.contentMode = UIViewContentModeScaleAspectFit

    self
  end
end
