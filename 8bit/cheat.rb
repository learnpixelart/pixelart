

types = {
  'Male' => [
               ['Hair',    (1..36).to_a ],
               ['Eye',     (1..32).to_a ],
               ['Mouth',   (1..26).to_a ],
               ['Clothes', (1..65).to_a ],
              ],
  'Female' => [
                 ['Hair',    (1..33).to_a ],
                 ['Eye',     (1..53).to_a ],
                 ['Mouth',   (1..17).to_a ],
                 ['Clothes', (1..59).to_a ],
                ]
}


types.each do |type, parts|
  puts "**#{type}**"
  puts
  parts.each do |rec|
    part_name = rec[0]
    part_nums = rec[1]
    puts
    puts "#{part_name} #{part_nums[0]}-#{part_nums[-1]}"
    puts
    part_nums.each do |num|
      puts "![](#{type.downcase}/#{part_name.downcase}/#{part_name.downcase}#{num}.png)"
    end
  end
end


puts "bye"

