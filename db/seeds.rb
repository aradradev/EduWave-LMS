# (1..10).each do |i|
#     Course.create!(title: "Course #{i}", description: "course #{i}")
# end

# db/seeds.rb

categories = [
  'Programming',
  'JavaScript',
  'Tailwind',
  'English',
  'Mathematics',
  'Science',
  'History',
  'Art',
  'Music',
  'Physical Education'
]

categories.each do |category_name|
  Category.create!(name: category_name)
end

puts "Seeded #{Category.count} categories."

puts "Seed successfully!"