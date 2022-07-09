
module Pixelart
class Color       ## todo/check - change class to module Color - why? why not?


  ## known built-in color names
  def self.build_names
    names = {
      '#00000000' => 'TRANSPARENT',
      '#000000ff' => 'BLACK',
      '#ffffffff' => 'WHITE',
    }

    ## auto-add grayscale 1 to 254
    (1..254).each do |n|
      hex = "#" + ('%02x' % n)*3
      hex << "ff"  ## add alpha channel (255)
      names[ hex ] = "8-BIT GRAYSCALE ##{n}"
    end

    names
  end

  NAMES = build_names



  def self.format( color )
    rgb = [r(color),
           g(color),
           b(color)]

    # rgb in hex (string format)
    #   note: do NOT include alpha channel for now - why? why not?
    hex = "#" + rgb.map{|num| '%02x' % num }.join

    hsl = to_hsl( color )
    hsv = to_hsv( color )

    buf = ''
    buf << hex
    buf << " / "
    buf << "rgb("
    buf << "%3d " % rgb[0]
    buf << "%3d " % rgb[1]
    buf << "%3d)"  % rgb[2]
    buf << " - "
    buf << "hsl("
    buf << "%3d° " % (hsl[0] % 360)
    buf << "%3d%% " % (hsl[1]*100+0.5).to_i
    buf << "%3d%%)" % (hsl[2]*100+0.5).to_i
    buf << " - "
    buf << "hsv("
    buf << "%3d° " % (hsv[0] % 360)
    buf << "%3d%% " % (hsv[1]*100+0.5).to_i
    buf << "%3d%%)" % (hsv[2]*100+0.5).to_i

    alpha = a(color)
    if alpha != 255
      buf << " - α(%3d%%)" % (alpha*100/255+0.5).to_i
    else
      buf << "          "  ## add empty for 255 (full opacity)
    end

    ## note: add alpha channel to hex
    alpha_hex = '%02x' % alpha
    name = NAMES[ hex+alpha_hex ]
    buf << " - #{name}"  if name

    buf
  end
  class << self
    alias_method :fmt, :format
  end

end  # class Color
end  # module Pixelart