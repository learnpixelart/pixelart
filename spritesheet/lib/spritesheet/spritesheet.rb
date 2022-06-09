
module Pixelart

  class Metadata
    class Sprite     ## todo/check: rename/change type to category - why? why not?
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


  class Spritesheet

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




 def self._build_recs( recs )   ## build and normalize (meta data) records
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

             ## todo:  double check if rec['type'] returns nil or empty string if column/field not present?
             type       = rec['type'] || rec['category']

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

 def self.read_records( path )
   recs = CsvHash.read( path )
   _build_recs( recs )
 end
 class << self
   alias_method :read_meta, :read_records
 end


 def self.read( image_path="./spritesheet.png",
                meta_path="./spritesheet.csv",
                 width: 24,
                 height: 24)
   img = ImageComposite.read( image_path, width: width, height: height )
   recs = read_records( meta_path )

   new( img, recs, width: width, height: height )
 end



 def initialize( img,
                 recs,
                 width: 24,
                 height: 24 )
    @width  = width
    @height = height

    ## todo: check if img is a ImageComposite or plain Image?
    ##              if plain Image "auto-wrap" into ImageComposite - why? why not?
    @image  = img
    @recs   = recs

    ## lookup by "case/space-insensitive" name / key
    @attributes_by_name = _build_attributes_by_name( @recs )
 end


 def image() @image; end
 alias_method  :composite, :image   # add some more aliases/alt names - why? why not?

 def records() @recs; end
 alias_method :meta, :records


 def find_meta_by( name:, warn: true )
    key = normalize_key( name )  ## normalize q(uery) string/symbol

    rec = @attributes_by_name[ key ]
    if rec
       puts " lookup >#{key}< => #{rec.id}: #{rec.name} / #{rec.type}"
    else
       puts "!! WARN - no lookup found for key >#{key}<"   if warn
    end

    rec
 end

 def find_by( name:, warn: true )
   rec = find_meta_by( name: name, warn: warn )

   ## return (cropped/sliced) image from image composite if record found
   rec ? @image[ rec.id ] : nil
 end

 def _find( name )  find_by( name: name, warn: false ); end
 alias_method :[], :_find


######
##  helpers
def _build_attributes_by_name( recs )
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

 end # class Spritesheet




 ## add convenience (alternate spelling) alias - why? why not?
 SpriteSheet = Spritesheet
 Sheet       = Spritesheet
 Sprite      = Spritesheet

end # module Pixelart
