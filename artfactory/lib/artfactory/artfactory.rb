####
#  "simple" generator (no different sizes, genders, etc.)
#     uses built-in spritesheet for (archetypes &) attributes



class Artfactory


 def self.read( image_path="./spritesheet.png",
                meta_path="./spritesheet.csv",
                width: 24,
                height: 24,
                image_class: Pixelart::Image )

    sheet = Pixelart::Spritesheet.read( image_path,
                                        meta_path,
                                        width: width, height: height )
    new( sheet, image_class: image_class )
 end

 def self.use( sheet, image_class: Pixelart::Image )    ### check - allow more sheets - why? why not?
     new( sheet, image_class: image_class )
 end



 def initialize( sheet, image_class: )
   @sheet       = sheet
   @image_class = image_class

   puts "  [artfactory] using image class >#{@image_class.name}< for #{@sheet.image.tile_width}x#{@sheet.image.tile_height} images"
 end

 def spritesheet() @sheet; end
 alias_method  :sheet, :spritesheet


 def to_recs( *values )
      recs       = []

      names = values

      names.each do |name|
        rec = @sheet.find_meta_by( name: name )
        if rec.nil?
           puts "!! ERROR - attribute (metadata record) >#{name}< not found; sorry"
           exit 1
        end
        recs << rec
      end

      recs
 end


 def generate_image( *values, before: nil )
    recs = to_recs( *values )

    ## note: first construct/generate image on transparent background
    ##          add background if present as LAST step
    img = @image_class.new( @sheet.image.tile_width,
                            @sheet.image.tile_height )

    recs.each do |rec|
      ## note: before call(back) MUST change image INPLACE!!!!
      before.call( img, rec )   if before
      img.compose!( @sheet.image[ rec.id ] )
    end

    img
 end
 alias_method :generate, :generate_image

end # class Artfactory



#############
## add convenience alternate spelling - why? why not?
ArtFactory = Artfactory
