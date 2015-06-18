class CCColor
  class << self
    def light_gray
      UIColor.colorWithRed(0.9, green: 0.9, blue: 0.9, alpha: 1)
    end

    def call_to_action
      UIColor.colorWithRed(0.353, green:0.859, blue:0.604, alpha:1)
    end

    def button_disabled
      UIColor.colorWithRed(0.6, green: 0.6, blue: 0.6, alpha: 1)
    end

    def footer_background
      UIColor.colorWithRed(0.988, green:0.988, blue:0.988, alpha:1)
    end
  end
end
