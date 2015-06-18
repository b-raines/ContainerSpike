module CCAutoLayoutView
  attr_accessor \
    :margin,
    :height,
    :width,
    :align,
    :vertical_align

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
    CCLayout.new(
      self,
      margin: margin,
      height: height,
      width: width,
      align: align,
      vertical_align: vertical_align
    ).constraints
  end

  private

  def constraints_provided?
    margin || height || width || align || vertical_align
  end
end
