module Footer
  class EnrollView < UIView
    include CCAutoLayoutView

    def init
      super

      self.height = 70
      self.margin = [0]
      self.addSubview(@enroll_button = CCButton.alloc.init_with_title('Start Free Trial'))
      self.addSubview(@left_bar_button = CCButton.alloc.init_with_image('down_arrow.png'))
      enroll_button.addGestureRecognizer(tapped_start_trial)
      self.addConstraints(subview_constraints)

      self
    end

    def tapped_start_trial
      UITapGestureRecognizer.alloc.initWithTarget(
        self,
        action: 'start_trial'
      )
    end

    def start_trial
      NSNotificationCenter.defaultCenter.postNotificationName('StartTrial', object: self)
    end

    protected

    attr_reader :enroll_button, :left_bar_button

    private

    def subview_constraints
      _constraints = []

      _constraints += CCLayout.new(
        left_bar_button,
        right_view: enroll_button,
        margin_left: 20,
        height: 20,
        width: 40,
        vertical_align: :center
      ).constraints

      _constraints += CCLayout.new(
        enroll_button,
        left_view: left_bar_button,
        height: 50,
        width: 150,
        align: :center,
        vertical_align: :center
      ).constraints

      _constraints
    end
  end
end
