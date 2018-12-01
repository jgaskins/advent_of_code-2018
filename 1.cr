# Part 1

puts File.new("1.input.txt").each_line.map(&.to_i32).sum

# Part 2

drifts = File.new("1.input.txt").each_line.map(&.to_i32).to_a
freqs = Set(Int32).new

freq = drifts.cycle.reduce(0) do |f, drift|
  f += drift.to_i32
  break f if freqs.includes? f

  freqs << f
  f
end

puts freq
