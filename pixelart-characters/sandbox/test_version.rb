###
#  to run use
#     ruby -I ./lib sandbox/test_version.rb


$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart/characters'



puts Pixelart::Module::Characters.root
puts Pixelart::Module::Characters.version
puts Pixelart::Module::Characters.banner


puts "bye"
