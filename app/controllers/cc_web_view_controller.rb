class CCWebViewController < UIViewController
  def init_with_delegate(delegate)
    init

    self.delegate = delegate

    self
  end

  def preload
    self.view.load_url
  end

  def delegate=(delegate)
    self.view.delegate = delegate
  end
end
