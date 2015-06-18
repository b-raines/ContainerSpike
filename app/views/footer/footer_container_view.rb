module Footer
  class FooterContainerView < UIView
    include CCAutoLayoutView

    def init
      super

      self.vertical_align = :bottom
      self.backgroundColor = CCColor.footer_background
      self.addSubview(Border.new(:top))

      self
    end
  end
end
