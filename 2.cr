ids = File.new("2.input.txt").each_line.to_a

# Part 1

puts ids
  .map { |line| line.each_char.group_by(&.itself).values.map(&.size).select { |count| count > 1 }.uniq }
  .to_a
  .flatten
  .select { |count| count > 1 }
  .group_by(&.itself)
  .transform_values(&.size)
  .values
  .reduce(1) { |product, item| product * item }

# Part 2

require "levenshtein"
ids.each.with_index do |id, index|
  found = Levenshtein.find(id, ids[0...index], tolerance: 1)
  if found
    id.each_char.with_index do |ch, index|
      print ch if found[index] == ch
    end
    puts
    break
  end
end
