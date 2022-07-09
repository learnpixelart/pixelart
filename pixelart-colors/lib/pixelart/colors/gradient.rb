
## inspired / helped by
##  https://en.wikipedia.org/wiki/List_of_software_palettes#Color_gradient_palettes
##  https://github.com/mistic100/tinygradient
##   https://mistic100.github.io/tinygradient/
##   https://bsouthga.dev/posts/color-gradients-with-python


module Pixelart

class Gradient

  def initialize( *stops )
    ## note:  convert stop colors to rgb triplets e.g.
    ##         from #ffffff to [255,255,255]
    ##              #000000 to [0,0,0]  etc.
    @stops = stops.map do |stop|
               stop = Color.parse( stop )
               [Color.r(stop), Color.g(stop), Color.b(stop)]
             end
  end


  def colors( steps )
    segments = @stops.size - 1

    ## note: gradient will include start (first)
    ##   AND stop color (last) - stop color is NOT excluded for now!!
    if segments == 1
       start = @stops[0]
       stop  = @stops[1]

       gradient = linear_gradient( start, stop, steps,
                                   include_stop: true )
    else
      steps_per_segment, mod = steps.divmod( segments )
      raise ArgumentError, "steps (#{steps}) must be divisible by # of segments (#{segments}); expected mod of 0 but got #{mod}"   if mod != 0

      gradient = []
      segments.times do |segment|
        start = @stops[segment]
        stop  = @stops[segment+1]
        include_stop =  (segment == segments-1)  ## note: only include stop if last segment!!

        # print "  segment #{segment+1}/#{segments} #{steps_per_segment} color(s) - "
        # print "  start: #{start.inspect}  "
        # print  include_stop ? 'include' : 'exclude'
        # print " stop:  #{stop.inspect}"
        # print "\n"

        gradient += linear_gradient( start, stop, steps_per_segment,
                                     include_stop: include_stop )
      end
    end

    ## convert to color (Integer)
    gradient.map do |color|
      Color.rgb( *color )
    end
 end



 def interpolate( start, stop, steps, n )
   ## note: n - expected to start with 1,2,3,etc.
   color = []
   3.times do |i|
     stepize = Float(stop[i] - start[i]) / Float(steps-1)
     value = stepize * n
     ## convert back to Integer from Float
     ##   add 0.5 for rounding up (starting with 0.5) - why? why not?
     value = (value+0.5).to_i
     value = start[i] + value

     color << value
   end
   color
 end


 def linear_gradient( start, stop, steps,
                      include_stop: true )

  gradient = [start]  ## auto-add start color (first color in gradient)

  if include_stop
    1.upto( steps-2 ).each do |n|  ## sub two (-2), that is, start and stop color
      gradient << interpolate( start, stop, steps, n )
    end
    # note: use original passed in stop color (should match calculated)
    gradient << stop
  else
    1.upto( steps-1 ).each do |n|  ## sub one (-1), that is, start color only
      ## note: add one (+1) to steps because stop color gets excluded (not included)!!
      gradient << interpolate( start, stop, steps+1, n )
    end
  end

  gradient
end



end  # class Gradient
end  # module Pixelart

