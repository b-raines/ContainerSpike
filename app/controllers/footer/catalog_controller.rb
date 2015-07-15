module Footer
  class CatalogController < UIViewController
    def loadView
      self.view = Footer::NotSignedIn::CatalogView.new
    end
  end
end
