###
#  to run use
#     ruby -I ./lib sandbox/test_silhouette.rb


require 'pixelart/base'


img = Pixelart::Image.read( './i/mooncat_white.png' )


silhouette = img.silhouette
silhouette.save( "./tmp/silhouette-mooncat.png" )
silhouette.zoom(4).save( "./tmp/silhouette-mooncat@4x.png" )

RED = '#ff0000'
silhouette = img.silhouette( RED )
silhouette.save( "./tmp/silhouette-mooncat_(2).png" )
silhouette.zoom(4).save( "./tmp/silhouette-mooncat_(2)@4x.png" )




puts "bye"