(1..10).each do |i|
    Course.create!(title: "Course #{i}", description: "course #{i}")
end

puts "Seed successfully!"