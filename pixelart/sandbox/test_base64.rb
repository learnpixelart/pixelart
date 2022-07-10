###
#  to run use
#     ruby -I ./lib sandbox/test_base64.rb


require 'pixelart/base'


img = Image.parse_base64( "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIiWNgGAXDHjASoeY/JfoJKfh/e2MDTklV/waCZjARYziPlCZWBVB5fD7EawHc8C/PrhNSRr4FlBhOlAWUAhZiFLXM2MzAwMDAUJPhiyFGCODyAUrqWbj9LENxiC6KAmxi2ABRPsCWVPElX2SAMw6gaZxigMsCnJlH1b+BJMuJCiJkQGzQwMDgSKYwgBw0xPqEJAtIDR4GBgqDiJjSlGgf4Eg5BOsDUlMRMRUUCqB5KgIAEEcvTXc8NnAAAAAASUVORK5CYII=" )
img.save( "./tmp/base64_1.png" )
img.zoom(8).save( "./tmp/base64_1@8x.png" )


puts "bye"
