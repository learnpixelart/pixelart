module Pixelart

class Image

def self.read( path )   ## convenience helper
  img_inner = ChunkyPNG::Image.from_file( path )
  img = new( img_inner.width, img_inner.height, img_inner )
  img
end



CHARS = '.@xo^~%*+=:'     ## todo/check: rename to default chars or such? why? why not?

## todo/check: support default chars encoding auto-of-the-box always
##                  or require user-defined chars to be passed in - why? why not?
def self.parse( pixels, colors:, chars: CHARS )
  has_keys  = colors.is_a?(Hash)   ## check if passed-in user-defined keys (via hash table)?

  colors = parse_colors( colors )
  pixels = parse_pixels( pixels )

  width  = pixels.reduce(1) {|width,row| row.size > width ? row.size : width }
  height = pixels.size

  img = new( width, height )

  pixels.each_with_index do |row,y|
    row.each_with_index do |color,x|
      pixel = if has_keys     ## if passed-in user-defined keys check only the user-defined keys
                colors[color]
              else
                ## try map ascii art char (.@xo etc.) to color index (0,1,2)
                ##   if no match found - fallback on assuming draw by number (0 1 2 etc.) encoding
                pos = chars.index( color )
                if pos
                  colors[ pos.to_s ]
                else ## assume nil (not found)
                  colors[ color ]
                end
              end

      img[x,y] = pixel
    end # each row
  end # each data

  img
end



def initialize( width, height, initial=Color::TRANSPARENT )
   ### todo/fix:
   ##  change params to *args only - why? why not?
   ##     make width/height optional if image passed in?

  if initial.is_a?( ChunkyPNG::Image )
    @img = initial
  else
    ## todo/check - initial - use parse_color here too e.g. allow "#fff" too etc.
    @img = ChunkyPNG::Image.new( width, height, initial )
  end
end



def zoom( zoom=2, spacing: 0 )
  ## create a new zoom factor x image (2x, 3x, etc.)

  width  = @img.width*zoom+(@img.width-1)*spacing
  height = @img.height*zoom+(@img.height-1)*spacing

  img = Image.new( width, height )

  @img.width.times do |x|
    @img.height.times do |y|
      pixel = @img[x,y]
      zoom.times do |n|
        zoom.times do |m|
          img[n+zoom*x+spacing*x,
              m+zoom*y+spacing*y] = pixel
        end
      end
    end # each x
  end # each y

  img
end
alias_method :scale, :zoom


def crop( x, y, crop_width, crop_height )
  Image.new( nil, nil,
              image.crop( x,y, crop_width, crop_height ) )
end



#######################
## filter / effects

def grayscale
  img = @img.grayscale
  Image.new( img.width, img.height, img )
end
alias_method :greyscale, :grayscale



def flip
  img = @img.flip
  Image.new( img.width, img.height, img )
end
alias_method :flip_horizontally, :flip

def mirror
  img = @img.mirror
  Image.new( img.width, img.height, img )
end
alias_method :flip_vertically, :mirror
alias_method :flop,            :mirror


def rotate_counter_clockwise   # 90 degrees
  img = @img.rotate_counter_clockwise
  Image.new( img.width, img.height, img )
end
alias_method :rotate_left, :rotate_counter_clockwise

def rotate_clockwise      # 90 degrees
  img = @img.rotate_clockwise
  Image.new( img.width, img.height, img )
end
alias_method :rotate_right, :rotate_clockwise



## add replace_colors alias too? - why? why not?
def change_colors( color_map )
  color_map = _parse_color_map( color_map )

  img = @img.dup  ## note: make a deep copy!!!
  _change_colors!( img, color_map )

  ## wrap into Pixelart::Image - lets you use zoom() and such
  Image.new( img.width, img.height, img )
end
alias_method :recolor, :change_colors



## predefined palette8bit color maps
##     (grayscale to sepia/blue/false/etc.)
##  - todo/check - keep "shortcut" convenience predefined map - why? why not?
PALETTE8BIT = {
  sepia: Palette8bit::GRAYSCALE.zip( Palette8bit::SEPIA ).to_h,
  blue:  Palette8bit::GRAYSCALE.zip( Palette8bit::BLUE ).to_h,
  false: Palette8bit::GRAYSCALE.zip( Palette8bit::FALSE ).to_h,
}

def change_palette8bit( palette )
  ## step 0: mapping from grayscale to new 8bit palette (256 colors)
  color_map = if palette.is_a?( String ) || palette.is_a?( Symbol )
                 PALETTE8BIT[ palette.to_sym ]
                 ## todo/fix: check for missing/undefined palette not found - why? why not?
              else
                 ##  make sure we have colors all in Integer not names, hex, etc.
                 palette = _parse_colors( palette )
                 Palette8bit::GRAYSCALE.zip( palette ).to_h
              end

  ## step 1: convert to grayscale (256 colors)
  img = @img.grayscale
  _change_colors!( img, color_map )

  ## wrap into Pixelart::Image - lets you use zoom() and such
  Image.new( img.width, img.height, img )
end
alias_method :change_palette256, :change_palette8bit


####
##  private helpers
def _parse_colors( colors )
  colors.map {|color| Color.parse( color ) }
end

def _parse_color_map( color_map )
  color_map.map do |k,v|
    [Color.parse(k),  Color.parse(v)]
  end.to_h
end

def _change_colors!( img, color_map )
  img.width.times do |x|
    img.height.times do |y|
      color = img[x,y]
      new_color = color_map[color]
      img[x,y] = new_color  if new_color
    end
  end
end




#####
# (image) delegates
##   todo/check: add some more??
def save( path, constraints = {} )
  # step 1: make sure outdir exits
  outdir = File.dirname( path )
  FileUtils.mkdir_p( outdir )  unless Dir.exist?( outdir )

  # step 2: save
  @img.save( path, constraints )
end
alias_method :write, :save


def compose!( other, x=0, y=0 )
  @img.compose!( other.image, x, y )    ## note: "unwrap" inner image ref
end
alias_method :paste!, :compose!


def width()        @img.width; end
def height()       @img.height; end

def []( x, y )          @img[x,y]; end
def []=( x, y, value )  @img[x,y]=value; end

def pixels()       @img.pixels; end

### todo/check: add colors()  e.g. @img.pixels.uniq  - why? why not?


## return image ref - use a different name - why? why not?
##   change to to_image  - why? why not?
def image()        @img; end




######
# helpers
def self.parse_pixels( pixels )
  data = []
  pixels.each_line do |line|
    line = line.strip
    next if line.start_with?( '#' ) || line.empty?   ## note: allow comments and empty lines

    ## note: allow multiple spaces or tabs to separate pixel codes
    ##  e.g.   o o o o o o o o o o o o dg lg w w lg w lg lg dg dg w w  lg dg o o o o o o o o o o o
    ##    or
    data << line.split( /[ \t]+/)
 end
 data
end



def self.parse_colors( colors )
  if colors.is_a?( Array )   ## convenience shortcut
    ## note: always auto-add color 0 as pre-defined transparent - why? why not?
    h = { '0' => Color::TRANSPARENT }
    colors.each_with_index do |color, i|
      h[ (i+1).to_s ] = Color.parse( color )
    end
    h
  else  ## assume hash table with color map
    ## convert into ChunkyPNG::Color
    colors.map do |key,color|
      ## always convert key to string why? why not?  use symbol?
      [ key.to_s, Color.parse( color ) ]
    end.to_h
  end
end


end # class Image
end  # module Pixelart

