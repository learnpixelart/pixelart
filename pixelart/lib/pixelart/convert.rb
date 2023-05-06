module Pixelart

class Image


## helper to convert (all) image in directory
##    chech: move to ImageUtils.convert  or such - why? why not?
##
##  what about the name e.g. rename to convert_dir or
##                                    batch_convert such - why? why not?
def self.convert( dir, from: 'jpg',
                       to: 'png',
                       outdir: nil,
                       overwrite: true )

    outdir = dir   if outdir.nil?

    files = Dir.glob( "#{dir}/*.#{from}" )
    puts "==> found #{files.size} image(s) to convert from #{from} to #{to} (overwrite mode set to: #{overwrite})"

    files.each_with_index do |file,i|
      dirname   = File.dirname( file )
      extname   = File.extname( file )
      basename  = File.basename( file, extname )

      ## skip convert if target / dest file already exists
      next  if overwrite == false && File.exist?( "#{outdir}/#{basename}.#{to}" )

      ##  note: make sure outdir exists (magic will not create it??)
      FileUtils.mkdir_p( outdir )  unless Dir.exist?( outdir )

      cmd = "magick convert #{dirname}/#{basename}.#{from} #{outdir}/#{basename}.#{to}"

      puts "   [#{i+1}/#{files.size}] - #{cmd}"
      ## todo/fix:   check return value!!! magick comand not available (in path) and so on!!!
      system( cmd )

      if from == 'gif'
        ## check for multi-images for gif
        ##   save  image-0.png  to  image.png
        path0 = "#{outdir}/#{basename}-0.#{to}"
        path  = "#{outdir}/#{basename}.#{to}"

        ##  note:  image-0.png only exists (gets generated) for multi-images
        if File.exist?( path0 )
          puts "   saving #{path0} to #{path}..."

          blob = File.open( path0, 'rb' ) { |f| f.read }
          File.open( path, 'wb' ) { |f| f.write( blob ) }
        end
      end
    end
end


end   # class Image
end   # class Pixelart