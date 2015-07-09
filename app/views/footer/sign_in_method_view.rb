module Footer
  class SignInMethodView < FooterView
    def init_with_fb_delegate(delegate)
      init

      facebook_button.delegate = delegate

      self
    end

    def init
      super

      self.addSubview(@facebook_button = FBSDKLoginButton.alloc.init)
      self.addSubview(@divider_label = DividerLabel.alloc.init)
      self.addSubview(@sign_in_button = CCButton.alloc.init_with_title(
        'Sign In with Email',
        font: CCFont.proxima_semibold(size: 16.5)
      ))
      self.addSubview(@cancel_button = CancelButton.alloc.init)

      facebook_button.readPermissions = ['public_profile', 'email']
      facebook_button.translatesAutoresizingMaskIntoConstraints = false

      TapEvent.new(sign_in_button, 'WillShowSignIn').register
      TapEvent.new(cancel_button, 'WillNavigateToPreviousFooterState').register

      self
    end

    protected

    attr_reader \
      :sign_in_button,
      :facebook_button,
      :divider_label,
      :cancel_button

    def subview_constraints
      _constraints = []

      _constraints += CCLayout.new(
        facebook_button,
        bottom_view: divider_label,
        margin_top: 25,
        margin_bottom: 5,
        height: 40,
        width: 220,
        align: :center
      ).constraints

      _constraints += CCLayout.new(
        divider_label,
        align: :center
      ).constraints

      _constraints += CCLayout.new(
        sign_in_button,
        top_view: divider_label,
        bottom_view: cancel_button,
        margin_top: 5,
        margin_bottom: 10,
        height: 40,
        width: 220,
        align: :center
      ).constraints

      _constraints += CCLayout.new(
        cancel_button,
        top_view: sign_in_button,
        margin_bottom: 5,
        align: :center,
      ).constraints

      _constraints
    end

    class DividerLabel < UILabel
      include CCAutoLayoutView

      def init
        super

        self.color = CCColor.dark_gray
        self.font = CCFont.proxima_bold(size: 14)
        self.textAlignment = NSTextAlignmentCenter
        self.text = 'OR'

        self
      end
    end
  end
end
