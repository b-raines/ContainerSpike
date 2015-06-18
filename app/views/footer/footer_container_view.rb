module Footer
  class FooterContainerView < UIView
    include CCAutoLayoutView

    def init
      super

      self.backgroundColor = UIColor.colorWithRed(0.988, green:0.988, blue:0.988, alpha:1)
      self.addSubview(Border.new(:top))

      self
    end
  end
end
