
# bonus / prologue / convenience 3rd party
# require 'csvreader'   -- add later - why? why not?


## stdlib
require 'pp'
require 'time'
require 'date'
require 'fileutils'

require 'json'
require 'yaml'




## our own code
require 'pixelart/colors/version'    # note: let version always go first
require 'pixelart/colors/color'
require 'pixelart/colors/format'

require 'pixelart/colors/gradient'
require 'pixelart/colors/palette'



puts Pixelart::Module::Colors.banner    # say hello
