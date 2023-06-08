

module Orc721
class Generator
   ###################
   ## convenience setup helper(s)
   def self.read( path, width: 24, height: 24 )
       new( Pixelart::ImageComposite.read( path,
                                           width: width,
                                           height: height ))
   end


   def initialize( spritesheet )
     ### todo: check for composite image type? - why? why not?
     @spritesheet = spritesheet
   end

   def _parse( spec )
     ## for delimiter allow for now:  - why? why not?
     ##     (multiple) space ( )
     ##      command or semicolon
     spec.strip.split( %r{[ ,;/_-]+} ).map {|v| v.to_i(10) }
   end

   def parse( spec )
      ## convenience helper
      ##   parses g spec in various (delimited) formats
      g = _parse( spec )
      generate( *g )
   end

   def generate( *attributes )
     img = Pixelart::Image.new( width, height )
     attributes.each do |num|
       img.compose!( @spritesheet[ num ] )
     end
     img
   end
   alias_method :g, :generate

   def width()   @spritesheet.tile_width; end
   def height()  @spritesheet.tile_height; end
   def count()   @spritesheet.count; end
end  # class Generator
end # module Orc721


######
##  add convenience aliases - why? why not?
ORC721 = Orc721
