module Pixelart


class Image
  def led( led=8, spacing: 2, round_corner: false )

    width  = @img.width*led  + (@img.width-1)*spacing
    height = @img.height*led + (@img.height-1)*spacing

    puts "  #{width}x#{height}"

    img = Image.new( width, height, Color::BLACK )

    @img.width.times do |x|
      @img.height.times do |y|
        pixel = @img[x,y]
        pixel = Color::BLACK  if pixel == Color::TRANSPARENT
        led.times do |n|
          led.times do |m|
            ## round a little - drop all four corners for now
            next  if round_corner &&
                    [[0,0],[0,1],[1,0],[1,1],[0,2],[2,0],
                     [0,led-1],[0,led-2],[1,led-1],[1,led-2],[0,led-3],[2,led-1],
                     [led-1,0],[led-1,1],[led-2,0],[led-2,1],[led-1,2],[led-3,0],
                     [led-1,led-1],[led-1,led-2],[led-2,led-1],[led-2,led-2],[led-1,led-3],[led-3,led-1],
                    ].include?( [n,m] )
            img[x*led+n + spacing*x,
                y*led+m + spacing*y] = pixel
          end
        end
      end
    end
    img
  end
end # class Image
end # module Pixelart

