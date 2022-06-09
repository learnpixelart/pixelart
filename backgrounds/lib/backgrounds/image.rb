module Pixelart
module Background    ## note: uses singular Background (no plural s here)


  SPRITESHEETS = {
    '24x24' => SpriteSheet.read( "#{Pixelart::Module::Backgrounds.root}/config/spritesheet-24x24.png",
                                 "#{Pixelart::Module::Backgrounds.root}/config/spritesheet-24x24.csv",
                                 width: 24, height: 24 )
  }


class Image < Pixelart::Image
  def self.generate( *values,
                       width:,
                       height: )

       ## check if spritesheet w/ patterns is available for width x height (eg.24x24)
       sheet = SPRITESHEETS[ "#{width}x#{height}" ]

       img = new( width, height )
       img = do_parse( img, *values, sheet: sheet )
       img
  end # method Image.generate

  ##
  ##  todo - what syntax to use for stripe/stripes ??
  ##                         or for gradient/gradients ??
  ##  stripe( color1 color2  )  ??
  ##  gradient( color1 color2 )
  def self.do_parse( img, *values, sheet:  )
      head = values[0]
      more = values[1..-1]

      while head do
         img = do_generate( img, head, sheet: sheet )

         head = more[0]
         more = more[1..-1]
      end
      img
  end


  def self.do_generate( img, value, sheet: )
    if value.is_a?( String )
        if ['ua','ukraine'].include?( value.downcase )
           img.ukraine
        elsif ['pride','rainbow'].include?( value.downcase )
           img.pride
        elsif sheet && pattern=sheet.find_by( name: value, warn: false ) ## try some built-in background patterns
           img.compose!( pattern )
           img
        else  ### assume color
          img.compose!( Image.new( img.width, img.height, value ) )
          img
        end
    elsif value.is_a?( Pixelart::Image )
      img.compose!( value )
      img
    else ###  assume integer  (assert) - why? why not
      img.compose!( Image.new( img.width, img.height, value ) )
      img
    end
  end

end # class Image
end # module Background
end # module Pixelart
