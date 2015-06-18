module Footer
  class FooterContainerView < UIView
    include CCAutoLayoutView

    def init
      super

      self.backgroundColor = UIColor.whiteColor
      self.addSubview(Border.new(:top))

      self
    end
  end
end
