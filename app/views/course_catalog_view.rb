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
      width: 270,
      height: 358,
      align: :center,
      vertical_align: :center
    ).constraints
  end
end
