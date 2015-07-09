class CCTextField < JVFloatLabeledTextField
  include CCAutoLayoutView

  def initialize(opts = {})
    _field = init

    _field.placeholder = opts.fetch(:placeholder, '')
  end

  def init
    super

    self.layer.borderWidth = 1
    self.layer.cornerRadius = 3
    self.layer.borderColor = CCColor.light_gray.CGColor
    self.backgroundColor = UIColor.whiteColor
    self.returnKeyType = UIReturnKeyDone
    self.floatingLabelActiveTextColor = CCColor.color_with_hex('#5ADB9A')
    self.paddingLeft = 10

    self
  end

  def setLabelOriginForTextAlignment
    super

    self.floatingLabel.tap do |fl|
      fl.frame = [
        [fl.origin.x + self.paddingLeft, fl.origin.y],
        [fl.frame.size.width, fl.frame.size.height]
      ]
    end
  end
end
