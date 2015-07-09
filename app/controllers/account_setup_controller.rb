class AccountSetupController < UIViewController
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
    self.view.addSubview(@content_view = AccountSetupView.new)
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

  def sign_in_user
    puts '******'
    puts 'SIGN IN'
    puts '******'
  end

  def text_did_change(notification)
    if form_is_valid?
      content_view.next_button.enable
    else
      content_view.next_button.disable
    end
  end

  def textFieldShouldReturn(text_field)
    text_field.resignFirstResponder
    sign_in_user if form_is_valid?
    true
  end

  private

  def form_is_valid?
    content_view.email_field.text.length > 0 &&
      content_view.password_field.text.length > 0 &&
      content_view.email_field.text["@"] &&
      content_view.email_field.text["."]
  end

  def sign_in_or_sign_up(notification)
    self.navigationController.pushViewController(coach_intro_controller, animated: true)
  end

  def dismiss_sign_in(notification)
    dismissViewControllerAnimated(true, completion: nil)
  end

  def coach_intro_controller
    @coach_intro_controller ||= CoachIntroController.alloc.init
  end

  def register_observations
    super

    Event.subscribe(self, 'SignInOrSignUp')
    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'text_did_change:',
      name: UITextFieldTextDidChangeNotification,
      object: nil
    )
  end
end
