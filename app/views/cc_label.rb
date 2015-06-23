class CCLabel < UILabel
  include CCAutoLayoutView

  def init_with_options(opts = {})
    init

    self.text = opts.fetch(:text, '')
    self.font = opts.fetch(:font, CCFont.proxima_regular)
    self.color = opts.fetch(:color, CCColor.dark_gray)
    self.numberOfLines = 0
    self.textAlignment = NSTextAlignmentCenter

    self
  end
end
