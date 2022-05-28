
def generate_image( *values, background: nil )
 ids = if values[0].is_a?( Integer )  ## assume integer number (indexes)
           values
       else ## assume strings (names)
           to_recs( *values ).map { |rec| rec.id }
       end

 img = Image.new( @width, @height )

 if background    ## for now assume background is (simply) color
    img.compose!( Image.new( @width, @height, background ) )
 end

 ids.each do |id|
   img = patch.call( id )   if patch
   img.compose!( @sheet[ id ] )
 end

 img
end
