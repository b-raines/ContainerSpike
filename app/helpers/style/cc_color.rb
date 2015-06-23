class CCColor
  class << self
    def light_gray
      color_with_hex('#D3D3D3')
    end

    def gray
      color_with_hex('#A8A8A8')
    end

    def dark_gray
      color_with_hex('#9B9B9B')
    end

    def teal
      color_with_hex('#3CBBC2')
    end

    def call_to_action
      color_with_hex('#5ADB9A')
    end

    def footer_background
      color_with_hex('#FCFCFC')
    end

    def color_with_hex(hex)
      rgb   = hex.scan(/([\da-f]{2})/i).flatten
      red   = rgb[0].hex / 255.0
      green = rgb[1].hex / 255.0
      blue  = rgb[2].hex / 255.0

      UIColor.colorWithRed(red, green: green, blue: blue, alpha: 1)
    end
  end
end
