module Footer
  class StatusController < UIViewController
    include CCInputToolbar

    def loadView
      self.view = Footer::StatusView.new
    end
  end
end
