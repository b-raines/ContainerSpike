module Footer
  class StatusController < UIViewController
    include CCInputToolbar

    def loadView
      self.view = Footer::StatusView.new
    end

    def viewWillAppear(animated)
      super

      input_fields.first.becomeFirstResponder
    end
  end
end
