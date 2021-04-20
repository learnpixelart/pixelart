require 'pp'

design =  "00011111100000000.01113333310000000.13533333331110000.01333134331331000.00133333431333111.00133335331333351.00133333431331111.01333134331333111.13533333331313351.01113333313341111.00011111133344411.00000133333341151.00000133333313331.00000133333333311.00000133333333110.00000113333331100.00000011133311000.00011100131110000.00013111131000000.00011333311000000.00000111110000000"



def parse_design( design )
  data = design.split('.')
  data = data.map do |row|
           row.chars.map do |color|
              color.to_i
           end
         end
  pp data
  puts "---"
  data.transpose.map { |row| row.reverse }    ## rotate by 90 degree
end

design = parse_design( design )
pp design


## step 2: print pixel data / matrix
puts '---'
design.each do |row|
  puts row.join( ' ' )
end
puts '---'