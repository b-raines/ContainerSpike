class SignInController < UIViewController
  include NoNavBar
  include NotificationObserver::Base

  attr_reader :content_view

  def prefersStatusBarHidden; true; end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.view.addSubview(@content_view = SignInView.new)
    content_view.email_field.delegate = self
    content_view.password_field.delegate = self
  end

  def viewWillAppear(animated)
    super

    content_view.email_field.becomeFirstResponder
  end

  def viewWillDisappear(animated)
    super

    content_view.endEditing(true)
  end

  protected

  def text_did_change(notification)
    if form_is_valid?
      content_view.next_button.enable
    else
      content_view.next_button.disable
    end
  end

  def textFieldShouldReturn(text_field)
    if form_is_valid?
      text_field.resignFirstResponder
      sign_in_user

      true
    end
  end

  private

  def sign_in_user
    CCHUD.show
    SessionManager.sign_in(email: content_view.email, password: content_view.password) do |error|
      if !error
        Event.trigger('UserSignedIn')
      else
        CCHUD.showErrorWithStatus('There was an error')
      end
    end
  end

  def user_signed_in(notification)
    dismissViewControllerAnimated(true, completion: nil)
    CCHUD.showSuccessWithStatus('Signed in!')
  end

  def sign_in_or_sign_up(notification)
    sign_in_user
  end

  def form_is_valid?
    content_view.email.length > 0 &&
      content_view.password.length > 0 &&
      content_view.email["@"] &&
      content_view.email["."]
  end

  def dismiss_sign_in(notification)
    dismissViewControllerAnimated(true, completion: nil)
  end

  def coach_intro_controller
    @coach_intro_controller ||= CoachIntroController.alloc.init
  end

  def register_observations
    super

    Event.subscribe(self, 'UserSignedIn')
    Event.subscribe(self, 'SignInOrSignUp')
    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'text_did_change:',
      name: UITextFieldTextDidChangeNotification,
      object: nil
    )
  end
end
