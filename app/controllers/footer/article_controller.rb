module Footer
  class ArticleController < UIViewController
    def loadView
      self.view = Footer::ArticleView.alloc.init
    end
  end
end
