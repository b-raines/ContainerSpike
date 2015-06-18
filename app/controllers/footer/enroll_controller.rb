module Footer
  class EnrollController < UIViewController
    def loadView
      self.view = Footer::EnrollView.new
    end
  end
end
