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

  def layout_constraints
    []
  end
end
