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
      self.addConstraints(subview_constraints)
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

  def screen_width
    UIScreen.mainScreen.bounds.size.width
  end

  def screen_height
    UIScreen.mainScreen.bounds.size.height
  end

  private

  def constraints_provided?
    margin || height || width || align || vertical_align
  end

  ## Override this method in subclass to provide constraints that are added when view is added to a view

  def subview_constraints
    []
  end
end
