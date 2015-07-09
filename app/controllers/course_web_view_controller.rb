class CourseWebViewController < CCWebViewController
  include NoNavBar

  attr_accessor :url

  def prefersStatusBarHidden; true; end

  def init
    super

    self.url = 'https://staging.changecollective.com/mobile/courses/10%25-happier/articles'

    self
  end
end
