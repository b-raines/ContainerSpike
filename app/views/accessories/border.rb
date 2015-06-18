class Border < UIView
  include CCAutoLayoutView

  def initialize(side, opts = {})
    init

    case side
    when :top
      self.margin = [0, 0, nil]
    when :right
      self.margin = [0, 0, 0, nil]
    when :bottom
      self.margin = [nil, 0, 0]
    when :left
      self.margin = [0, nil, 0, 0]
    end

    self.height = opts.fetch(:thickness, 1)
    self.backgroundColor = opts.fetch(:color, CCColor.light_gray)

    self
  end
end
