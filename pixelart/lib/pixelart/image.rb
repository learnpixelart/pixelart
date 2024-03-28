module Pixelart

class Image


##  keep track of all (inherited) subclasses via inherited hook
##
## change/rename  to descendants - why? why not?
##
## note about rails (activesupport?)
##  If you use rails >= 3, you have two options in place.
##    Use .descendants if you want more than one level depth of children classes,
##    or use .subclasses for the first level of child classes.

def self.subclasses
  @subclasses ||= []
end

def self.inherited( subclass )
  subclasses << subclass
end




def self.read( path )   ## convenience helper
  img_inner = ChunkyPNG::Image.from_file( path )
  new( img_inner.width, img_inner.height, img_inner )
end

def self.parse_base64( str )
  blob = Base64.decode64( str )
  img_inner = ChunkyPNG::Image.from_blob( blob )
  new( img_inner.width, img_inner.height, img_inner )
end

def self.blob( blob )
  img_inner = ChunkyPNG::Image.from_blob( blob )
  new( img_inner.width, img_inner.height, img_inner )
end

class << self
   alias_method :from_blob, :blob
end





CHARS = '.@xo^~%*+=:'     ## todo/check: rename to default chars or such? why? why not?

## todo/check: support default chars encoding auto-of-the-box always
##                  or require user-defined chars to be passed in - why? why not?
def self.parse( pixels, colors:,
                        background: Color::TRANSPARENT,
                        chars: CHARS,
                        width: nil,
                        height: nil )
  has_keys  = colors.is_a?(Hash)   ## check if passed-in user-defined keys (via hash table)?

  colors = parse_colors( colors )

  ## note: for now use strict parser only 
  ##        if colors with hash map / keys defined
  ##         will raise error / exit if unknown token found!!!
  ##   AND  pixels is a single txt / text string to parse (NOT array of string lines) 
  ##
  #
  #  note default for now is:
  #      1) tokens separated by space if not strict (e.g. has no color keys AND not array of strings)
  #      2) every char is a token  if array of strings
  pixels =  if has_keys && pixels.is_a?( String )
              keys = colors.keys.map { |key| key.to_s }
              ## todo/fix: - sort by lenght first; 
              ##           - escape for rx chars!!
              rx = /#{keys.join('|')}/
              parse_pixels_strict( rx, pixels )  
            else
              parse_pixels( pixels )
            end 

  ## note: for now only use (require) width for flattened/streamed text input
  if width   
     ## always flattern first - why? why not?
     ##   allow multi-line text inputs - allow/support why? why not?
     pixels = pixels.flatten.each_slice( width ).to_a
  else
    ## find row with max width  
    width  = pixels.reduce(1) {|width,row| row.size > width ? row.size : width }
    height = pixels.size
  end

   background = Color.parse( background )   unless background.is_a?( Integer )

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


      img[x,y] = if background && background != Color::TRANSPARENT &&
                                  pixel == Color::TRANSPARENT
                   background   ## note: auto-fill transparent with background color
                 else
                   pixel
                 end
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


##  shift image n-pixels to the left (NOT changing width/height)
def left( left )
  img = Image.new( width, height )
  img.compose!( crop( 0, 0, width-left, height ), left, 0 )
  img
end


def to_blob
  @img.to_blob
end
alias_method :blob, :to_blob


#######################
## filter / effects

def grayscale
  img = @img.grayscale
  Image.new( img.width, img.height, img )
end
alias_method :greyscale, :grayscale


######################
#  flip horizontally on x-axis (top-to-bottom/bottom-to-top)
#    e.g. pixels on the top will now be pixels on the bottom
#
#  todo/check:   commom use is reverse?
#     e.g. flip_vertically is top-to-bottom!!!
#      use flip_y_axis, flip_x_axis or something else - why? why not?
#    check photoshop and gimp terminology and update later if different - why? why not?
def flip_horizontally
  img = @img.flip_horizontally
  Image.new( img.width, img.height, img )
end
## keep flop? alias - why? why not?
##   note: chunky_png use flip alias for flip_horizontally!!!!
alias_method :flop, :flip_horizontally



###
#  flip vertially on y-axis (right-to-left/left-to-right)
#     e.g. pixels on the left will now be pixels on the right
def mirror
  img = @img.mirror
  Image.new( img.width, img.height, img )
end
alias_method :flip_vertically, :mirror
alias_method :flip,            :mirror   ## note: chunky_png use flip alias for flip_horizontally (top-to-bottom)!!!!
alias_method :phlip,           :mirror   ## philip the intern ("hand-phlip one-by-one")
alias_method :hand_phlip,      :mirror


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
  ## _change_colors!( img, color_map )

  ##
  ## keep/ignore alpha channel
  ##  fix: make formula more efficient - quick hack for now
  img.width.times do |x|
    img.height.times do |y|
      color = img[x,y]
      r = Color.r( color )
      g = Color.g( color )
      b = Color.b( color )
      a = Color.a( color ) 

      new_color = color_map[ Color.rgb( r,g,b ) ]
      if new_color
        nr = Color.r( new_color )
        ng = Color.g( new_color )
        nb = Color.b( new_color )
        ## todo/fix:
        ##  check for na(lpha) - if present, use!!!
        ##                          otherwise ignore

        img[x,y] = Color.rgba( nr, ng, nb, a )
      end    
    end
  end



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
def self.parse_pixels( obj )
  pixels = []
  if obj.is_a?( Array )  ## assume array of string (lines)
      lines = obj
      lines.each do |line|
        ##  convert (string) line into indidual chars
        pixels << line.each_char.reduce( [] ) { |mem, c| mem << c; mem }
      end
  else  ## assume it's a (multi-line) string (with newlines)
        ##  assert and throw ArgumentError if not? - why? why not?
      txt = obj
      txt.each_line do |line|
        line = line.strip
        next if line.start_with?( '#' ) || line.empty?   ## note: allow comments and empty lines

        ## note: allow multiple spaces or tabs
        ##   to separate pixel codes
        ##  e.g.   o o o o o o o o o o o o dg lg w w lg w lg lg dg dg w w  lg dg o o o o o o o o o o o
        ##    or
        pixels << line.split( /[ \t]+/ )
     end
  end
  pixels
end


def self.parse_pixels_strict( rx, txt )
    ## must match tokens in regex (rx)  e.g. /0|1|2|3../ or /A|B|C... etc./
    pixels = []

    txt.each_line do |line|
       line = line.strip
       next if line.start_with?( '#' ) || line.empty?   ## note: allow comments and empty lines

       scan = StringScanner.new( line )
       tokens = []
       loop do
         # puts "  pos: #{scan.pos} - size: #{scan.rest.size} - #{scan.rest}"  
         token = scan.scan( rx )
         if token.nil?
          ## todo/fix: raise an exception here
           puts "!! ERROR - parse error; expected match of #{rx.to_s} but got: #{scan.rest}"
           exit 1
         end      
         tokens << token
         
         scan.skip( /[ \t]+/ )    
         break if scan.eos?
       end
       pixels << tokens
    end
    pixels
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

