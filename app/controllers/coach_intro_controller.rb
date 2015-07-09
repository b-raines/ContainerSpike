class CoachIntroController < UIViewController
  include NotificationObserver::Base

  attr_reader :content_view

  def prefersStatusBarHidden; true; end

  def init
    super

    self.view.backgroundColor = UIColor.whiteColor

    self
  end

  def viewDidLoad
    self.view.addSubview(@content_view = CoachIntroView.new)
    content_view.name_field.delegate = self
    content_view.phone_field.delegate = self
  end

  def viewWillAppear(animated)
    super

    content_view.name_field.becomeFirstResponder
  end

  def viewWillDisappear(animated)
    super

    content_view.endEditing(true)
  end

  def sign_up_user
    puts '******'
    puts 'SIGN UP'
    puts '******'
  end

  def dismiss_coach_intro(notification)
    self.navigationController.popViewControllerAnimated(true)
  end

  def text_did_change(notification)
    if form_is_valid?
      content_view.sign_in_button.enable
    else
      content_view.sign_in_button.disable
    end
  end

  def textFieldShouldReturn(text_field)
    text_field.resignFirstResponder
    sign_up_user if form_is_valid?
    true
  end

  def form_is_valid?
    content_view.name_field.text.length > 0 && content_view.phone_field.text.length == 17
  end

  def register_observations
    super

    Event.subscribe(self, 'DismissCoachIntro')
    Event.subscribe(self, 'TextDidChange')
    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'text_did_change:',
      name: UITextFieldTextDidChangeNotification,
      object: nil
    )
  end
end
