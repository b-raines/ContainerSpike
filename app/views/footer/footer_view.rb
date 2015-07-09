## This is a base class for all footer views, meant to be subclassed and not used on it's own (although it technically could be).

module Footer
  class FooterView < UIView
    include CCAutoLayoutView

    DEFAULT_FOOTER_HEIGHT = 60

    def init
      super

      self.margin = [0]
      self.width = screen_width

      self
    end
  end
end
