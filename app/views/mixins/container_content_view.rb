module ContainerContentView
  attr_accessor :gutter

  def constraints
    layout_constraints(bottom: true, top: true)
  end

  def layout_constraints(opts = {})
    _constraints = []
    metrics = {
      'hMargin' => self.gutter,
    }

    _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
      vertical_format(opts),
      options: 0,
      metrics: metrics,
      views: { 'view' => self }
    )

    _constraints += NSLayoutConstraint.constraintsWithVisualFormat(
      'H:|-hMargin-[view]-hMargin-|',
      options: 0,
      metrics: metrics,
      views: { 'view' => self }
    )

    _constraints
  end

  def gutter
    @gutter ||= 0
  end

  private

  def vertical_format(opts = {})
    top    = opts[:top]    ? '|' : ''
    bottom = opts[:bottom] ? '|' : ''

    "V:#{top}[view]#{bottom}"
  end
end
