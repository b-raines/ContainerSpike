module Footer
  class EnrollView < FooterView
    def init
      super

      self.addSubview(@enroll_button = CCButton.alloc.init_with_title('Start Free Trial'))
      self.addSubview(@left_bar_button = CCButton.alloc.init_with_image('down_arrow.png'))
      left_bar_button.setImageEdgeInsets(UIEdgeInsetsMake(10,10,10,10))
      TapEvent.new(enroll_button, 'StartTrial').register
      TapEvent.new(left_bar_button, 'WillDismissCourseView').register

      self
    end

    protected

    attr_reader :enroll_button, :left_bar_button

    private

    def subview_constraints
      _constraints = []

      _constraints += CCLayout.new(
        left_bar_button,
        right_view: enroll_button,
        margin: [0, nil, 0, 23],
        vertical_align: :center
      ).constraints

      _constraints += CCLayout.new(
        enroll_button,
        left_view: left_bar_button,
        height: 40,
        width: 150,
        align: :center,
        vertical_align: :center
      ).constraints

      _constraints
    end
  end
end
