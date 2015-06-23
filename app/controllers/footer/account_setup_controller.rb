module Footer
  class AccountSetupController < UIViewController
    include CCInputToolbar

    def loadView
      self.view = Footer::AccountSetupView.alloc.init
    end

    def viewWillAppear(animated)
      super

      input_fields.first.becomeFirstResponder
    end
  end
end
