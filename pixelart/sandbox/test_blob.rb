###
#  to run use
#     ruby -I ./lib sandbox/test_blob.rb


require 'pixelart/base'


blob = Base64.decode64( "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIiWNgGAXDHjASoeY/JfoJKfh/e2MDTklV/waCZjARYziPlCZWBVB5fD7EawHc8C/PrhNSRr4FlBhOlAWUAhZiFLXM2MzAwMDAUJPhiyFGCODyAUrqWbj9LENxiC6KAmxi2ABRPsCWVPElX2SAMw6gaZxigMsCnJlH1b+BJMuJCiJkQGzQwMDgSKYwgBw0xPqEJAtIDR4GBgqDiJjSlGgf4Eg5BOsDUlMRMRUUCqB5KgIAEEcvTXc8NnAAAAAASUVORK5CYII=" )


img = Image.blob( blob )
img.save( "./tmp/blob.png" )
img.zoom(8).save( "./tmp/blob@8x.png" )

img = Image.from_blob( blob )
img.save( "./tmp/blob2.png" )
img.zoom(8).save( "./tmp/blob2@8x.png" )

img2 = Image.blob( img.blob )
img2.save( "./tmp/blob3.png" )
img2.zoom(8).save( "./tmp/blob3@8x.png" )

img2 = Image.blob( img.to_blob )
img2.save( "./tmp/blob3.png" )
img2.zoom(8).save( "./tmp/blob3@8x.png" )


puts "bye"
