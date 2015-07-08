class CourseCatalogView < UIView
  include CCAutoLayoutView

  def init
    super

    self.margin = [0]
    self.backgroundColor = CCColor.teal
    self.addSubview(@button = CCButton.alloc.init_with_image('course_card.png'))
    self.addConstraints(button_constraints)
    TapEvent.new(@button, 'WillNavigateToCourseView').register

    self
  end

  def button_constraints
    CCLayout.new(
      @button,
      margin: [107.5, 35, 45, 15]
    ).constraints
  end
end
