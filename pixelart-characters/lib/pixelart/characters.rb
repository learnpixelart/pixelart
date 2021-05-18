require 'pixelart/base'



## our own code
require 'pixelart/characters/version'    # note: let version always go first



module Pixelart
class Character     ## todo/check: rename to Generator or Artist or such? why? why not?


def self.build( chars, format=nil )
  ## try to unify characters format
  ##  format 1  - "compact" style
  ##   check for attributes with "type flags" e.g.
  ##   face:  { required: true,
  ##             attributes: [['', 'u'],
  ##                          ['', 'u']] },

  if format && [:compact].include?( format.downcase.to_sym )
    ## note: assumes male/female types
    chars_by_type = { 'male'   => {},
                      'female' => {},
                    }
    m = chars_by_type['male']     ## access shortcuts
    f = chars_by_type['female']

    ## mouth: { attributes: [['Black Lipstick',  'f'],
    ##                       ['Red Lipstick',    'f'],
    ##                       ['Smile',           'u'],
    ##                       ['',                'u'],
    ##                       ['Teeth Smile',     'm'],
    ##                       ['Purple Lipstick', 'f']]}
    chars.each do |part_key, part|
      ##  always convert keys to string for now - why? why not?
      part_key = part_key.to_s

      ## todo/fix: add/pass along required: true/false too - skiped for now
      ##              add at the end? if some attributes present? why? why not?
      part[:attributes].each_with_index do |rec,i|
         attr_name = rec[0]
         type_flag = rec[1]  ## char type flag e.g. m/f/u (male/female/unisex)

         attribute = {
           ## todo/check: rename path to id - why? why not? (for now its basename w/o extension etc.)
           path: "#{part_key}/#{part_key}#{i+1}"     ## map to filename (note: w/o extension for now)
         }
         attribute[:name] = attr_name   if attr_name && attr_name.size > 0

         ## note: only add part "on demand", that is, if no attributes for m/f than no part too
         if type_flag == 'm' || type_flag == 'u'
           m_attributes = ( m[part_key] ||= { attributes: [] } )[:attributes]
           m_attributes << attribute
         end

         if type_flag == 'f' || type_flag == 'u'
          f_attributes = ( f[part_key] ||= { attributes: [] } )[:attributes]
          f_attributes << attribute
         end
       end
    end

    puts "(normalized) characters spec:"
    pp chars_by_type

    chars_by_type
  else  ##  pass-through for now
    chars
  end
end



def initialize( chars, dir: '.',
                       format: nil )
  ## todo/check: (re)name format param to style or ? - find a better name - why? why not?

  @chars = self.class.build( chars, format )  ## build ("unify/normalize") characters spec

  @rootdir = dir
end

def types() @chars.keys; end


def random( type=nil )
  type = types[ rand( types.size ) ]   if type.nil?

  character = @chars[ type ]

  nums = []
  character.each do |_, part|
    attributes_size = if part.is_a?( Hash )
                        part[:attributes].size
                      else  ## assume array - "inline" compact attribute format
                        part.size
                      end

    ## todo/fix: check for part optional (true/false) ?
    ##   if optional possible (start rand at 0 NOT 1) - why? why not?
    nums << rand( 1..attributes_size )
  end
  generate( type, *nums )
end


## todo/fix: add alternate support for **kwargs
##            instead of positional number list - why? why not?
def generate( type, *args )
  puts "==> generate >#{type}< - with #{args.size} part(s) #{args.inspect}"

  character = @chars[ type ]

  img = nil   ## (by default) auto-derive width x height dimension from first image

  character.each_with_index do |(part_key, part),i|
    num  = args[i]

    ## todo/check - double check if part required set to false - why? why not?
    next if num == 0    ## note: skip part if index is 0!!!

    attributes = if part.is_a?( Hash )
                   part[:attributes]
                 else  ## assume array - "inline" compact attribute format
                   part
                 end

    attribute = attributes[ num-1 ]  ## note: num starts counting at 1 (sub 1 for zero-based array index)
    raise ArgumentError, "no >#{part_key}< part found for index #{num}; sorry" if attribute.nil?

    print "#{i} #{part_key} => #{num}"
    print " - #{attribute[:name]}"  if attribute.is_a?( Hash ) && attribute.has_key?( :name )
    print "\n"


    img_part = if attribute.is_a?( Integer )  ## assume filename with num (as .png)
                  path = "#{@rootdir}/#{type}/#{part_key}/#{part_key}#{num}.png"
                  img_part = Image.read( path )
               elsif attribute.is_a?( Hash )
                  if attribute.has_key?( :design )
                    path = "#{@rootdir}/#{attribute[:design]}.txt"
                    txt = File.open( path, 'r:utf-8') {|f| f.read }
                    img_part = Image.parse( txt, colors: attribute[:colors] )
                  else  ## assume for now has key :path
                    path = "#{@rootdir}/#{attribute[:path]}.png"
                    img_part = Image.read( path )
                  end
               else
                  puts "!! ERROR:"
                  pp part
                  raise ArgumentError, "unknown part data type; expected Integer|Hash"
               end
    ## note: if (very) first part - auto-create empty image with size/dimensions from part
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

