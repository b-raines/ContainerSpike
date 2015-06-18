module Footer
  class EnrollView < UIView
    include CCAutoLayoutView

    def init
      super

      self.height = 60
      self.margin = [0]
      self.addSubview(@enroll_button = CCButton.alloc.init_with_title('Start Free Trial'))
      self.addSubview(@left_bar_button = CCButton.alloc.init_with_image('down_arrow.png'))
      TapEvent.new(enroll_button, 'StartTrial').register
      TapEvent.new(left_bar_button, 'DismissContent').register
      self.addConstraints(subview_constraints)

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
        margin_left: 33,
        height: 12,
        width: 24,
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
