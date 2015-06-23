class CourseWebView < CCWebView
  include CCAutoLayoutView

  def init
    super

    self.delegate = self
    self.url = 'http://staging.changecollective.com/mobile/courses/slim-by-design'
    load_url

    self
  end
end
