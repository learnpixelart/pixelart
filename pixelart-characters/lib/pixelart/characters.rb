require 'pixelart/base'



## our own code
require 'pixelart/characters/version'    # note: let version always go first



module Pixelart
class Character     ## todo/check: rename to Generator or Artist or such? why? why not?

def initialize( chars, dir: '.' )
  @chars   = chars  ## characters spec
  @rootdir = dir
end

def types() @chars.keys; end


def random( type=nil )
  type = types[ rand( types.size ) ]   if type.nil?

  character = @chars[ type ]

  nums = []
  character.each do |_, parts|
     nums << rand( 1..parts.size )
  end
  generate( type, *nums )
end

## todo/fix: add alternate support for **kwargs
##            instead of positional number list - why? why not?
def generate( type, *args )
  puts "==> generate >#{type}< - with #{args.size} part(s) #{args.inspect}"

  character = @chars[ type ]

  img = nil   ## (by default) auto-derive width x height dimension from first image

  character.each_with_index do |(part_key, parts),i|
    num  = args[i]
    puts "#{i} #{part_key} => #{num}"
    part = parts[ num-1 ]  ## note: num starts counting at 1 (sub 1 for zero-based array index)
    raise ArgumentError, "no >#{part_key}< part found for index #{num}; sorry" if part.nil?

    img_part = if part.is_a?( Integer )  ## assume filename with num (as .png)
                  path = "#{@rootdir}/#{type}/#{part_key}/#{part_key}#{num}.png"
                  img_part = Image.read( path )
               elsif part.is_a?( Hash )
                  path = "#{@rootdir}/#{part[:design]}.txt"
                  txt = File.open( path, 'r:utf-8') {|f| f.read }
                  img_part = Image.parse( txt, colors: part[:colors] )
               else
                  puts "!! ERROR:"
                  pp part
                  raise ArgumentError, "unknown part data type; expected Integer|Hash"
               end
    img = Image.new( img_part.width, img_part.height )  if i==0
    img.compose!( img_part )
  end

  img
end

end # class Character
end # module Pixelart



###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart


puts Pixelart::Module::Characters.banner    # say hello

