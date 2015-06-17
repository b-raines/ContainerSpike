module Footer
  class FooterContainerView < UIView
    include CCAutoLayoutView

    def init
      super

      self.margin = [0]
      self.backgroundColor = UIColor.whiteColor
      add_top_border

      self
    end

    def add_top_border
      @border = UIView.new.tap do |border|
        border.backgroundColor = UIColor.colorWithRed(0.9, green: 0.9, blue: 0.9, alpha: 1)
        border.translatesAutoresizingMaskIntoConstraints = false
      end

      self.addSubview(@border)

      _constraints = CCLayoutConstraints.new(
        @border,
        vertical_align: :top,
        height: 1,
        margin: [nil, 0]
      ).constraints

      self.addConstraints(_constraints)
    end
  end
end
