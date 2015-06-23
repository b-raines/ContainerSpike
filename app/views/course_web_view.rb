class CourseWebView < UIWebView
  include CCAutoLayoutView

  attr_accessor :url

  def init
    super

    self.delegate = self
    self.url = 'http://staging.changecollective.com/mobile/courses/slim-by-design'

    self
  end
end
