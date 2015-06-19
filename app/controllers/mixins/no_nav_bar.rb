module NoNavBar
  def viewWillAppear(animated)
    super

    navigationController.setNavigationBarHidden(true, animated: animated)
  end
end
