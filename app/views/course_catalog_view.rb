class CourseCatalogView < UIView
  include CCAutoLayoutView

  def init
    super

    self.margin = [0]
    self.backgroundColor = UIColor.whiteColor
    self.addSubview(@button = CCButton.alloc.init_with_title('Course'))
    self.addConstraints(button_constraints)
    TapEvent.new(@button, 'NavigateToCourse').register

    self
  end

  def button_constraints
    CCLayout.new(
      @button,
      width: 150,
      height: 50,
      align: :center,
      vertical_align: :center
    ).constraints
  end
end
