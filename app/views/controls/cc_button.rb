class CCButton < UIButton
  include CCAutoLayoutView

  def init_with_title(title, opts = {})
    init

    @color = opts.fetch(:color, UIColor.whiteColor)
    @disabled_color = opts.fetch(:disabled_color, UIColor.whiteColor)
    @background_color = opts.fetch(:background_color, CCColor.call_to_action)
    @disabled_background_color = opts.fetch(:disabled_background_color, CCColor.light_gray)

    self.layer.cornerRadius = 4
    self.layer.masksToBounds = true
    self.font = opts.fetch(:font, CCFont.proxima_regular)
    self.backgroundColor = background_color
    self.setTitle(title, forState: UIControlStateNormal)
    self.setTitle(title, forState: UIControlStateDisabled)
    self.setTitleColor(color, forState: UIControlStateNormal)
    self.setTitleColor(disabled_color, forState: UIControlStateDisabled)

    disable if opts[:disabled]

    self
  end

  def init_with_image(image)
    init

    self.setImage(UIImage.imageNamed(image), forState: UIControlStateNormal)
    self.imageView.contentMode = UIViewContentModeScaleAspectFit
    self.imageEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)

    self
  end

  def enable
    self.enabled = true
    self.backgroundColor = background_color
  end

  def disable
    self.enabled = false
    self.backgroundColor = disabled_background_color
  end

  protected

  attr_reader \
    :color,
    :disabled_color,
    :background_color,
    :disabled_background_color
end
