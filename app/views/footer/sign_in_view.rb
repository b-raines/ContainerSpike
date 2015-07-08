module Footer
  class SignInView < FooterView
    def init
      super

      self.addSubview(@sign_in_button = CCButton.alloc.init_with_title('Sign In'))
      TapEvent.new(sign_in_button, 'WillNavigateToSignIn').register

      self
    end

    protected

    attr_reader :sign_in_button

    private

    def subview_constraints
     CCLayout.new(
        sign_in_button,
        margin: [10, nil],
        height: 40,
        width: 150,
        align: :center,
        vertical_align: :center
      ).constraints
    end
  end
end
