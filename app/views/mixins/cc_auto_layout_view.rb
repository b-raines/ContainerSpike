module CCAutoLayoutView
  attr_accessor \
    :margin,
    :height,
    :width

  def init
    super

    self.translatesAutoresizingMaskIntoConstraints = false

    self
  end

  def didMoveToSuperview
    if constraints_provided? && superview
      superview.addConstraints(implicit_layout_constraints)
    end
  end

  def implicit_layout_constraints
    CCLayoutConstraints.new(
      self,
      margin: margin,
      height: height,
      width: width
    ).constraints
  end

  private

  def constraints_provided?
    margin || height || width
  end
end
