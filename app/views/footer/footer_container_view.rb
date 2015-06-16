module Footer
  class FooterContainerView < UIView
    include ContainerContentView

    def init
      super

      self.backgroundColor = UIColor.whiteColor
      self.translatesAutoresizingMaskIntoConstraints = false
      add_top_border

      self
    end

    def constraints
      layout_constraints(bottom: true)
    end

    def add_top_border
      @border = UIView.new.tap do |border|
        border.backgroundColor = UIColor.colorWithRed(0.9, green: 0.9, blue: 0.9, alpha: 1)
        border.translatesAutoresizingMaskIntoConstraints = false
      end

      self.addSubview(@border)

      _constraints = []

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'V:|[border(1)]',
        options: 0,
        metrics: nil,
        views: { 'border' => @border }
      )

      _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
        'H:|[border]|',
        options: 0,
        metrics: nil,
        views: { 'border' => @border }
      )

      self.addConstraints(_constraints)
    end
  end
end
