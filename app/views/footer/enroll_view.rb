module Footer
  class EnrollView < UIView
    include CCAutoLayoutView

    def init
      super

      self.margin = [0]
      self.addSubview(@button = CCButton.alloc.init_with_title('Start Free Trial'))
      @button.addGestureRecognizer(tapped_start_trial)
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

    attr_reader :button

    private

    def subview_constraints
      CCLayoutConstraints.new(
        button,
        margin: [10, nil],
        height: 50,
        width: 150,
        align: :center
      ).constraints
    end
  end
end
