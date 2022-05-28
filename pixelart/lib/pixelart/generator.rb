####
#  "simple" generator (no different sizes, genders, etc.)
#     uses built-in spritesheet for (archetypes &) attributes


module Pixelart

  class Metadata
    class Sprite
      attr_reader :id, :name, :type, :more_names

      def initialize( id:,
                      name:,
                      type:,
                      more_names: [] )
         @id         = id      # zero-based index eg. 0,1,2,3, etc.
         @name       = name
         @type       = type
         @more_names = more_names
      end
   end  # class Metadata::Sprite
  end # class Metadata




  class Generator

 ######
 # static helpers  - (turn into "true" static self.class methods - why? why not?)
 #
 def self.normalize_key( str )
   ## add & e.g. B&W
   ## add ' e.g. McDonald's Red
    str.downcase.gsub(/[ ()&°'_-]/, '').strip
 end

 def self.normalize_name( str )
   ## normalize spaces in more names
   str.strip.gsub( /[ ]{2,}/, ' ' )
 end

 def normalize_key( str )     self.class.normalize_key( str ); end
 def normalize_name( str )    self.class.normalize_name( str ); end



 def build_attributes_by_name( recs )
    h = {}
    recs.each_with_index do |rec|
      names = [rec.name] + rec.more_names

      names.each do |name|
        key = normalize_key( name )

        if h[ key ]
          puts "!!! ERROR - attribute name is not unique:"
          pp rec
          puts "duplicate:"
          pp h[key]
          exit 1
        end
        h[ key ] = rec
      end
   end
    ## pp h
    h
 end


 def build_recs( recs )   ## build and normalize (meta data) records
    ## sort by id
    recs = recs.sort do |l,r|
                       l['id'].to_i( 10 ) <=> r['id'].to_i( 10 )   # use base10 (decimal)
                     end

    ## assert all recs are in order by id (0 to size)
    recs.each_with_index do |rec, exp_id|
       id = rec['id'].to_i(10)
       if id != exp_id
          puts "!! ERROR -  meta data record ids out-of-order - expected id #{exp_id}; got #{id}"
          exit 1
       end
    end

    ## convert to "wrapped / immutable" kind-of struct
    recs = recs.map do |rec|
             id         = rec['id'].to_i( 10 )
             name       = normalize_name( rec['name'] )
             type       = rec['type']

             more_names = (rec['more_names'] || '').split( '|' )
             more_names = more_names.map {|str| normalize_name( str ) }

             Metadata::Sprite.new(
               id:         id,
               name:       name,
               type:       type,
               more_names: more_names )
           end
    recs
 end  # method build_recs



 def initialize( image_path="./spritesheet.png",
                 meta_path="./spritesheet.csv",
                 width: 24,
                 height: 24 )
    @width  = width
    @height = height

    @sheet = ImageComposite.read( image_path, width: @width, height: @height )
    recs  = CsvHash.read( meta_path )

    @recs = build_recs( recs )

    ## lookup by "case/space-insensitive" name / key
    @attributes_by_name = build_attributes_by_name( @recs )
 end


 def spritesheet() @sheet; end
 alias_method  :sheet, :spritesheet


 def records() @recs; end
 alias_method :meta, :records




 def find_meta( q )
    key = normalize_key( q )  ## normalize q(uery) string/symbol

    rec = @attributes_by_name[ key ]
    if rec
       puts " lookup >#{key}< => #{rec.id}: #{rec.name} / #{rec.type}"
    else
       puts "!! WARN - no lookup found for key >#{key}<"
    end

    rec
 end

 def find( q )
    rec = find_meta( q )

    ## return image if record found
    rec ? @sheet[ rec.id ] : nil
 end


 def to_recs( *values )
      recs       = []

      attribute_names  = values

      attribute_names.each do |attribute_name|
        attribute = find_meta( attribute_name )
        if attribute.nil?
           puts "!! ERROR - attribute >#{attribute_name}< not found; sorry"
           exit 1
        end
        recs << attribute
      end

      recs
 end



 def generate_image( *values, background: nil, before: nil )
   ## note: generate_image NO longer supports
   ##             - generate by integer number (indexes), sorry

    recs = to_recs( *values )

    ## note: first construct/generate image on transparent background
    ##          add background if present as LAST step
    img = Image.new( @width, @height )

    recs.each do |rec|
      ## note: before call(back) MUST change image INPLACE!!!!
      before.call( img, rec )   if before
      img.compose!( @sheet[ rec.id ] )
    end

    if background    ## for now assume background is (simply) color
      img2 = Image.new( @width, @height )
      img2.compose!( Image.new( @width, @height, background ) )
      img2.compose!( img )
      img = img2
    end

    img
 end
 alias_method :generate, :generate_image

 end # class Generator

end # module Pixelart
