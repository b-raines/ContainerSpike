module Footer
  class SignInView < UIView
    include CCAutoLayoutView

    def init
      super

      self.height = DEFAULT_FOOTER_HEIGHT
      self.margin = [0]
      self.addSubview(@sign_in_button = CCButton.alloc.init_with_title('Sign In'))
      self.addConstraints(subview_constraints)
      TapEvent.new(sign_in_button, 'WillNavigateToSignIn').register

      self
    end

    protected

    attr_reader :sign_in_button

    private

    def subview_constraints
      CCLayout.new(
        sign_in_button,
        height: 40,
        width: 150,
        align: :center,
        vertical_align: :center
      ).constraints
    end
  end
end
